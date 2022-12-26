import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Favorite',
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Favorite',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
