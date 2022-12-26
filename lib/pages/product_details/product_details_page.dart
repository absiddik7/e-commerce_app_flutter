import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:counter_button/counter_button.dart';
import 'package:badges/badges.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productDescription,
      required this.productRating,
      required this.productCategory})
      : super(key: key);

  final String productName;
  final String productImage;
  final double productPrice;
  final String productDescription;
  final double productRating;
  final String productCategory;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool fav = false;
  int quantity = 1;
  double price = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      price = widget.productPrice;
    });
  }

  void setPrice(int amount) {
    setState(() {
      price = price * amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
       
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Badge(
              toAnimate: false,
              shape: BadgeShape.circle,
              position: BadgePosition.topEnd(top: 0, end: -15),
              badgeColor: Colors.deepOrange,
              borderRadius: BorderRadius.circular(8),
              badgeContent: const Text('0',
                  style: TextStyle(fontSize: 10, color: Colors.white)),
              child: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FancyShimmerImage(
                            height: 400,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            imageUrl: widget.productImage,
                            shimmerBaseColor: Colors.grey[300]!,
                            shimmerHighlightColor: Colors.blue[300]!,
                            shimmerBackColor: Colors.red[300]!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // rating bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.productRating.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                RatingBarIndicator(
                                  rating: widget.productRating,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 30,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                Text(
                                  '(${widget.productRating})',
                                  style: const TextStyle(
                                    color: Color(0xFF8B97A2),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            FavoriteButton(
                              iconSize: 40,
                              isFavorite: fav,
                              valueChanged: (_isFavorite) {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        // description
                        const Text("Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),

                        const SizedBox(
                          height: 5,
                        ),
                        // description
                        Text(
                          maxLines: 4,
                          widget.productDescription,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),

          // price
          Container(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: CounterButton(
                      loading: false,
                      onChange: (int val) {
                        setState(() {
                          if (val > 0) {
                            quantity = val;
                            price = widget.productPrice * val.toDouble();
                          }
                        });
                      },
                      count: quantity,
                      countColor: Colors.black,
                      buttonColor: Colors.black,
                    ))
              ],
            ),
          ),

          // add to cart button
          Container(
            height: 45,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onPressed: () {
                //
              },
              child: Text('Add to cart',
                  style: const TextStyle(
                    fontSize: 18,
                  )),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
