import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../controller/product_controller.dart';
import 'widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final loginController = Get.put(LoginController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              loginController.logout();
              Navigator.of(context).pushReplacementNamed('/loginPage');
            }, 
            child: Text('Logout')
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator(),);
              } else {
                return MasonryGridView.count(
                  itemCount: productController.productList.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2, 
                  itemBuilder: (context, index) {
                    return ProductTile(
                      product: productController.productList[index]
                    );
                  }
                );
              }
            })
          ),
        ],
      ),
    );
  }
}