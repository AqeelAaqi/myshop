import 'package:flutter/material.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  ProductsGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final productsData = Provider.of<Products>(context);
    final products = showFavorites? productsData.favoriteItems : productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value:products[index],
              child: ProductItem(),
            ));
  }
}
