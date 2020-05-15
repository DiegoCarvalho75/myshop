import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../provider/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showOnlyFavorites;
  ProductsGrid(this._showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        _showOnlyFavorites ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // itemBuilder: (ctx, i) => ChangeNotifierProvider(
        //   create: (context) => products[i],
        //   child:  ProductItem(),
        // ),
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            ),
      ),
    );
  }
}
