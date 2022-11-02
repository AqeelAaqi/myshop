import 'package:flutter/material.dart';
import 'package:myshop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget{
  static const String routName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
    ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title),),
      body: Container(),
    );
  }
}