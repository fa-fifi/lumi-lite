import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';

class CategoryModel extends ChangeNotifier {
  final List<NewsModel> _latest = [];
  final List<NewsModel> _trending = [];
  final List<NewsModel> _news = [];

  UnmodifiableListView<NewsModel> get latest => UnmodifiableListView(_latest);
  UnmodifiableListView<NewsModel> get trending =>
      UnmodifiableListView(_trending);
  UnmodifiableListView<NewsModel> get news => UnmodifiableListView(_news);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _latest.length * 42;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(NewsModel news) {
    _latest.add(news);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _latest.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
