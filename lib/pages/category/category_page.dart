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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Category',style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Category Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
