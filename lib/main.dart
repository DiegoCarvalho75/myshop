import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './provider/cart.dart';
import './provider/products.dart';
import './provider/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loja',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.amberAccent,
          canvasColor: Colors.amber[100],
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(height: 2, fontSize: 14),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.all(10.0),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(24.0),
              borderSide: new BorderSide(),
            ),
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
