import 'package:flutter/material.dart';

class EditProductSreen extends StatefulWidget {

  static const routeName = '/edit-product';

  @override
  _EditProductSreenState createState() => _EditProductSreenState();
}

class _EditProductSreenState extends State<EditProductSreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
