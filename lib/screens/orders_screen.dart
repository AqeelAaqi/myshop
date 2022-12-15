import 'package:flutter/material.dart';
import 'package:myshop/providers/orders.dart' as ord;
import 'package:myshop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:myshop/widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrderScreen createState() => _OrderScreen();
}

class _OrderScreen extends State<OrdersScreen> {
  late Future _ordersFuture;
  Future _obtainedOrderFuture()
  {
    return Provider.of<ord.Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    // TODO: implement initState
    _ordersFuture = _obtainedOrderFuture();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final ordersData = Provider.of<ord.Orders>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _ordersFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return Text('An error occured!');
            } else {
              return Consumer<ord.Orders>(builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, index) =>
                      OrderItem(orderData.orders[index])));
            }
          }
        },
      ),
    );
  }
}
