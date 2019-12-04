import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

import '../provider/products.dart';
import '../provider/cart.dart';

enum filterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).size.height);

    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.favorite_border,
              size: 35,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Mostrar Todos'),
                value: filterOptions.All,
              ),
              PopupMenuItem(
                child: Text('Apenas Favoritos'),
                value: filterOptions.Favorites,
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(CartScreen.routeName),
            child: Consumer<Cart>(
              builder: (_, cart, __) => Badge(
                color: Colors.red[800],
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                value: cart.itemCount.toString(),
              ),
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
