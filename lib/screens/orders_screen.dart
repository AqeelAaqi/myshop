import 'package:flutter/material.dart';
import 'package:myshop/providers/orders.dart' as ord;
import 'package:myshop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:myshop/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<ord.Orders>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (ctx, index) => OrderItem(ordersData.orders[index])),
    );
  }
}
