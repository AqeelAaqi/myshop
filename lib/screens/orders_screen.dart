import 'package:flutter/material.dart';
import 'package:myshop/providers/orders.dart' as ord;
import 'package:provider/provider.dart';
import 'package:myshop/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<ord.Orders>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (ctx, index) => OrderItem(ordersData.orders[index])),
    );
  }
}
