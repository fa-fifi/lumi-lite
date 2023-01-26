import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';

// Todo: Add shared pref.
class ActivityModel extends ChangeNotifier {
  final List<NewsModel> _history = [];

  UnmodifiableListView<NewsModel> get history => UnmodifiableListView(_history);

  void addHistory(NewsModel news) {
    _history.add(news);
    debugPrint(_history.length.toString());
    notifyListeners();
  }
}
