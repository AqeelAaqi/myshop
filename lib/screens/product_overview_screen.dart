import 'package:flutter/material.dart';
import 'package:myshop/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: new ProductGrid(),
    );
  }
}
