import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(
            Icons.favorite,
            size: 20,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {},
        ),
        title: Text(
          title,
          style:
              Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.shopping_cart,
            size: 20,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
