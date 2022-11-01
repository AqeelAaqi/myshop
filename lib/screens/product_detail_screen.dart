import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget{
  static const String routName = '/product_detail_screen';

  @override
  Widget build(BuildContext context) {
    final String productID = ModalRoute.of(context)?.settings.arguments as String;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('title'),),
      body: Container(),
    );
  }
}