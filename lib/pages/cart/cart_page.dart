import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('CartPage',
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CartPage',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
