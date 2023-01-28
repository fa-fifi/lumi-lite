import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';
import 'package:lumilite/models/publisher.dart';
import 'package:lumilite/models/topic.dart';

// Todo: Add shared pref.
class ActivityModel extends ChangeNotifier {
  final List<NewsModel> _history = [];
  int _duration = 0;

  UnmodifiableListView<NewsModel> get history => UnmodifiableListView(_history);

  Duration get duration => Duration(seconds: _duration);

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
    final folded = _history.fold<Map<TopicModel, int>>({}, (map, news) {
      map[news.topic] = (map[news.topic] ?? 0) + 1;
      return map;
    });

    final sortedKeys = folded.keys.toList()
      ..sort((b, a) => folded[a]!.compareTo(folded[b]!));

    return folded.isEmpty ? null : sortedKeys.first;
  }

  void addHistory(NewsModel news) {
    _history.add(news);
    notifyListeners();
  }

  void addDuration(int seconds) {
    _duration += seconds;
    notifyListeners();
  }
}
