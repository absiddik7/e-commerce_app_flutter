import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CartPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
