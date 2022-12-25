import 'dart:convert';

import 'package:shopping/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiData {
  List<ProductsModel> products = [];

  // all products
  Future<void> getAllProducts() async {
    String url = "https://fakestoreapi.com/products";

    try {
      var response = await http.get(
        Uri.parse(url),
      );

      

      var jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        ProductsModel productsModel = ProductsModel.fromJson(element);
        products.add(productsModel);

        //print("products.length : ${products.length}");
      });
    } catch (e) {
      print(e);
    }
  }
}
