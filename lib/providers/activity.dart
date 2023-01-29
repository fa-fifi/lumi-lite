import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';
import 'package:lumilite/models/publisher.dart';
import 'package:lumilite/models/topic.dart';

class ActivityProvider extends ChangeNotifier {
  final List<NewsModel> _history = [];
  int _screentime = 0;

  UnmodifiableListView<NewsModel> get history => UnmodifiableListView(_history);

  Duration get screentime => Duration(seconds: _screentime);

  NewsModel? get recentlyViewed => _history.isEmpty ? null : _history.last;

  List<PublisherModel> get topPublishers {
    final List<PublisherModel> result =
        _history.fold<List<PublisherModel>>([], (list, news) {
      list.any((publisher) => publisher.name == news.publisherName)
          ? list
              .singleWhere((publisher) => publisher.name == news.publisherName)
              .count++
          : list.add(PublisherModel(
              name: news.publisherName, icon: news.publisherIcon, count: 1));

      return list..sort((b, a) => a.count.compareTo(b.count));
    });

    return result.length > 3 ? result.sublist(0, 3) : result;
  }

  TopicModel? get topCategory {
    final Map<TopicModel, int> result = _history.fold({}, (map, news) {
      map[news.topic] = (map[news.topic] ?? 0) + 1;
      return map;
    });

    final List<TopicModel> sortedResult = result.keys.toList()
      ..sort((b, a) => result[a]!.compareTo(result[b]!));

    return result.isEmpty ? null : sortedResult.first;
  }

  void addHistory(NewsModel news) {
    _history.add(news);
    notifyListeners();
  }

  void addScreentime(int seconds) {
    _screentime += seconds;
    notifyListeners();
  }
}
