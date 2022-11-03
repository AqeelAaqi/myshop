import 'package:flutter/material.dart';
import 'package:myshop/providers/products.dart';
import 'package:myshop/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All
}

class ProductsOverviewScreen extends StatefulWidget {
  // ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductsOverviewScreen createState() => _ProductsOverviewScreen();
}

class _ProductsOverviewScreen extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorite'), value: FilterOptions.Favorites,),
              PopupMenuItem(child: Text('Show All'), value:FilterOptions.All,),
            ],
            onSelected: (FilterOptions selectedValue) => {
              setState(() {
                if(selectedValue == FilterOptions.Favorites){
                  _showFavoritesOnly = true;
            // productsContainer.showFavoritesOnly()
               }else {
                  _showFavoritesOnly = false;
            // productsContainer.showAll()
                }
              })
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: new ProductGrid(_showFavoritesOnly),
    );
  }
}
