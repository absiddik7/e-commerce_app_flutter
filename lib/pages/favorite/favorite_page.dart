import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({ Key? key }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoritePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoritePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
