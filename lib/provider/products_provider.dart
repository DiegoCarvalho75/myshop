import 'package:flutter/material.dart';
import '../models/products.dart';

class Products with ChangeNotifier {
  List<Products> _items = [];

  List<Products> get items {
    return [..._items];
  }

  void addProduct() {
    notifyListeners();
  }
}
