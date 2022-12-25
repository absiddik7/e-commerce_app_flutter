import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:shopping/data/api/api.dart';
import 'package:shopping/data/models/product_model.dart';
import 'package:shopping/pages/product_details/product_details_page.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  final searchController = TextEditingController();
  var searchItem = '';
  bool fav = false;
  List<ProductsModel> allProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 310,
            //childAspectRatio: MediaQuery.of(context).size.aspectRatio * 0.62,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      productName: allProducts[index].title.toString(),
                      productImage: allProducts[index].image.toString(),
                      productPrice: allProducts[index].price!.toDouble(),
                      productDescription:
                          allProducts[index].description.toString(),
                      productRating:
                          allProducts[index].rating!.rate!.toDouble(),
                      productCategory: allProducts[index].category.toString(),
                    ),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        //product image
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      //product image
                                      child: FancyShimmerImage(
                                        width: 100,
                                        height: 180,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        imageUrl:
                                            allProducts[index].image.toString(),
                                        shimmerBaseColor: Colors.grey[300]!,
                                        shimmerHighlightColor:
                                            Colors.blue[300]!,
                                        shimmerBackColor: Colors.red[300]!,
                                      )),
                                ),
                              ],
                            ),
                            // product name
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                    allProducts[index].title.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // category
                                  Text(
                                    //'jewelery',
                                    allProducts[index].category.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // rating
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            allProducts[index]
                                                .rating!
                                                .rate
                                                .toString(),
                                          ),
                                          Text(
                                            '(${allProducts[index].rating!.count.toString()})',
                                            style: const TextStyle(
                                              color: Color(0xFF8B97A2),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // product price
                                  Text(
                                    '\$ ${allProducts[index].price.toString()}',
                                    style: const TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // favorite button
                        Positioned(
                            right: 5,
                            // favorite button

                            child: FavoriteButton(
                              iconSize: 40,
                              isFavorite: fav,
                              valueChanged: (_isFavorite) {},
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
