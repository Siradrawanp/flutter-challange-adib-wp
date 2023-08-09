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
          discountPercentage: product['discountPercentage'],
          rating: product['rating'],
          stock: product['stock'],
          brand: product['brand'],
          category: product['category'],
          thumbnail: product['thumbnail'],
          images: List<String>.from(product['images']),
        );
      }).toList();


      return productList;


      // for (var product in prods) {
      //   print('Product ID: ${product['id']}');
      //   print('Product Title: ${product['title']}');
      //   print('Product Description: ${product['description']}');
      //   print('Product Price: ${product['price']}');
      //   print('Product Discount Percentage: ${product['discountPercentage']}');
      //   print('Product Rating: ${product['rating']}');
      //   print('Product Stock: ${product['stock']}');
      //   print('Product Brand: ${product['brand']}');
      //   print('Product Category: ${product['category']}');
      //   print('Product Thumbnail: ${product['thumbnail']}');
      //   print('Product Images: ${product['images']}');
      //   print('');        
      // }
      
      // return productFromJson(prods);
      // return data.map((e) => productFromJson(e)).toList();
      // if (response.statusCode == 200) {
      //   var prod = jsonDecode(response.body[1]);
      //   return productFromJson(prod);
      // }      
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}