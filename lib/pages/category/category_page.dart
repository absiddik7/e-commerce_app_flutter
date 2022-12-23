import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({ Key? key }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CategoryPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
