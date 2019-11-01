import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import '../screens/edit_product_screen.dart';

import '../provider/products.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key key}) : super(key: key);
  static const routeName = '/UserProductsScreen';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Produtos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        color: Colors.black,
        backgroundColor: Colors.cyan,
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  UserProductItem(
                      productsData.items[index].id,
                      productsData.items[index].title,
                      productsData.items[index].imageUrl),
                  Divider(
                    color: Colors.purpleAccent,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
