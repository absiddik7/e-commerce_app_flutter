import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({ Key? key }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailsPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductDetailsPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
