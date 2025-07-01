import 'package:flutter/material.dart';

class CartItem {
  final String imagePath;
  final String name;
  final String options;
  final double price;
  int qty;

  CartItem({
    required this.imagePath,
    required this.name,
    required this.options,
    required this.price,
    this.qty = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get total => _items.fold(0, (sum, item) => sum + item.price * item.qty);

  void addItem(CartItem item) {
    // If item with same name and options exists, increase qty
    final index = _items.indexWhere((i) => i.name == item.name && i.options == item.options);
    if (index != -1) {
      _items[index].qty += item.qty;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQty(CartItem item, int qty) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index].qty = qty;
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
} 