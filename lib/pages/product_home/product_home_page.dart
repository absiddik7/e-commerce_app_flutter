import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:shopping/pages/product_details/product_details_page.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductHomePage'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailsPage(),
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
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNETWKjUSYf-T8Sf-_sISoARXrUQQ7uAFNaA&usqp=CAU',
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // product name
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // category
                                  const Text(
                                    'jewelery',
                                    style: TextStyle(
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12,
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
                                        color: Colors.orange,
                                        size: 16,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            '4.1',
                                          ),
                                          Text(
                                            '(205)',
                                            style: TextStyle(
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
                                  const Text(
                                    '\$ 22.3',
                                    style: TextStyle(
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

                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: FavoriteButton(
                                iconSize: 40,
                                isFavorite: fav,
                                valueChanged: (_isFavorite) {
                                  // var x = controller.products[index];
                                  // var y = favController.favItems;

                                  // if (_isFavorite) {
                                  //   if (y.contains(x)) {
                                  //     final snackBar = SnackBar(
                                  //       content: const Text(
                                  //           'Already in the favorite!'),
                                  //       action: SnackBarAction(
                                  //         label: 'Ok',
                                  //         onPressed: () {
                                  //           //do some thing
                                  //         },
                                  //       ),
                                  //     );
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(snackBar);
                                  //   } else {
                                  //     favController.favItems
                                  //         .add(controller.products[index]);
                                  //   }
                                  // } else {
                                  //   favController.favItems.removeAt(index);
                                  // }
                                },
                              ),
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
