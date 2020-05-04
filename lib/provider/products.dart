import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  final String authToken;
  final String userId;

  Products(
    this._items,
    this.authToken,
    this.userId,
  );

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

  Future<void> fetchAndSetProducts() async {
    var url =
        'https://curso-dad78.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extratedData = json.decode(response.body) as Map<String, dynamic>;
      if (extratedData == null) {
        return;
      }
      // print(extratedData);
      url =
          'https://curso-dad78.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      extratedData.forEach((prodId, prodData) {
        // print(favoriteData[prodId]);
        loadedProducts.add(
          Product(
              id: prodId,
              title: prodData['title'],
              description: prodData['description'],
              price: prodData['price'],
              imageUrl: prodData['imageUrl'],
              isFavorite:
                  favoriteData == null ? false : favoriteData[prodId] ?? false),
          // favoriteData['-M5z7GHV55YYy6I3Xkol'] == null || true || false?
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://curso-dad78.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
        }),
      );

      if (response.statusCode >= 400) {
        // print(response.statusCode);
        throw HttpException(
            'Status Code ${response.statusCode} Erro ao inserir produto.');
      }

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
      final url =
          'https://curso-dad78.firebaseio.com/products/$id.json?auth=$authToken';
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
  Future<void> updateFav(String productId, String userId) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == productId);

    if (prodIndex >= 0) {
      _items[prodIndex].isFavorite = !_items[prodIndex].isFavorite;
      notifyListeners();
      final url =
          'https://curso-dad78.firebaseio.com/userFavorites/$userId/$productId.json?auth=$authToken';
      await http
          .put(
        url,
        body: json.encode(
          _items[prodIndex].isFavorite,
        ),
      )
          .then((response) {
        // print(response);
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
    final url =
        'https://curso-dad78.firebaseio.com/products/$id.json?auth=$authToken';
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
