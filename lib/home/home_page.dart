import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping/pages/cart/cart_page.dart';
import 'package:shopping/pages/category/category_page.dart';
import 'package:shopping/pages/favorite/favorite_page.dart';
import 'package:shopping/pages/product_home/product_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  //botom naivation bar pages
  final pages = [
    const ProductHomePage(),
    const CategoryPage(),
    const FavoritePage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              backgroundColor: Colors.grey.shade100,
              tabBackgroundColor: Colors.deepOrange.shade200,
              haptic: true,
              rippleColor: Colors.green,
              hoverColor: Colors.grey,    
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.category_outlined,
                  text: 'Category',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                ),
              ]),
        ),
      ),
    );
  }
}