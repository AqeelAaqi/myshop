import 'package:flutter/material.dart';
import 'package:myshop/helpers/custom_route.dart';
import 'package:myshop/providers/auth.dart';
import 'package:myshop/screens/orders_screen.dart';
import 'package:myshop/screens/user_product_screen.dart';
import 'package:provider/provider.dart';
import '../screens/get_test_data.dart';
import '../screens/userdata_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Evolve'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              // Navigator.of(context).pushReplacement(CustomRoute(builder: (ctx) => OrdersScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Test Dio'),
            onTap: (){
              // Navigator.of(context).pushReplacementNamed(UserDataScreen.routeName);
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDataScreen()));

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: (){
                Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context,listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
