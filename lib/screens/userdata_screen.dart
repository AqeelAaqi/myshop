import 'package:flutter/material.dart';
import 'get_test_data.dart'; // Replace 'your_package_name' with the actual package name

class UserDataScreen extends StatelessWidget {
  static const routeName = '/data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: UserDataWidget(),
      ),
    );
  }
}
