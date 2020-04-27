import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart' as http;
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  final String authToken;

  Products(this.authToken, this._items);

  List<Product> get items {
    /// equivale [_items.toList()]
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> fetchAndSetProducts() async {
    final url =
        'https://curso-dad78.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extratedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extratedData);
      final List<Product> loadedProducts = [];
      extratedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
            isFavorite: prodData['isFavorite']));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://curso-dad78.firebaseio.com/products.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        }),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product product) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);

    if (prodIndex >= 0) {
      final url = 'https://curso-dad78.firebaseio.com/products/$id.json';
      await http.patch(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
          }));
      _items[prodIndex] = product;
      notifyListeners();
    }
  }

  ///[ Optimistic Update ]
  Future<void> updateFav(String id) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);

    if (prodIndex >= 0) {
      _items[prodIndex].isFavorite = !_items[prodIndex].isFavorite;
      notifyListeners();
      final url = 'https://curso-dad78.firebaseio.com/products/$id.json';
      await http
          .patch(url,
              body: json.encode({
                'isFavorite': _items[prodIndex].isFavorite,
              }))
          .then((response) {
        if (response.statusCode >= 400) {
          _items[prodIndex].isFavorite = !_items[prodIndex].isFavorite;
          throw HttpException(
              'Status Code ${response.statusCode} Erro ao atualizar favoritos.');
        }
        // print(response.body);
      }).catchError((e) {
        print(e);
      });
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = 'https://curso-dad78.firebaseio.com/products/$id.json';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    await http.delete(url).then((response) {
      if (response.statusCode >= 400) {
        // print(response.status Code);
        throw HttpException('Erro ao deletar produto.');
      }
      existingProduct = null;
    }).catchError((onError) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Erro ao deletar produto.');
    });
  }
}
