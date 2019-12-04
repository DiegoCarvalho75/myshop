import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './utils/toHex.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './provider/cart.dart';
import './provider/products.dart';
import './provider/orders.dart';
import './provider/auth.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/auth-screen.dart';
import './screens/edit_product_screen.dart';
import './teste/teste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
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
          canvasColor: HexColor("#2635c5"),
          textTheme: Theme.of(context).textTheme.copyWith(
                body1: new TextStyle(
                  color: Colors.black,
                ),
                display1: new TextStyle(
                  color: HexColor('#78909C'),
                ),
                display4: new TextStyle(
                  color: HexColor('#78909b'),
                  fontWeight: FontWeight.w900,
                ),
              ),
          primaryTextTheme: Theme.of(context).primaryTextTheme.copyWith(
                  button: TextStyle(
                color: HexColor('#7E57C2'),
              )),
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
        home: Teste(), //AuthScreen()
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
