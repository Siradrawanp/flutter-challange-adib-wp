import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ist_hometest_app/model/products_model.dart';


class ProductServices {
  static var client = http.Client();
  static Future getProducts() async {
    Uri url = Uri.parse('https://dummyjson.com/products');
    try {
      var response = await http.get(url);
      var data = json.decode(response.body);
      var prods = data['products'];

      final productList = prods.map<Product>((product) {
        return Product(
          id: product['id'],
          title: product['title'],
          description: product['description'],
          price: product['price'],
          discountPercentage: product['discountPercentage'].toDouble(),
          rating: product['rating'].toDouble(),
          stock: product['stock'],
          brand: product['brand'],
          category: product['category'],
          thumbnail: product['thumbnail'],
          images: List<String>.from(product['images']),
        );
      }).toList();


      return productList;      
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}