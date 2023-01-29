import 'package:flutter/material.dart';
import 'package:lumilite/models/topic.dart';

class SettingsProvider extends ChangeNotifier {
  final List<TopicModel> _topics = [
    TopicModel.latest,
    TopicModel.trending,
    TopicModel.news,
  ];

  List<TopicModel> get topics {
    _topics.sort(((a, b) => a.index.compareTo(b.index)));
    return _topics;
  }

  bool updateTopic(TopicModel topic) {
    _topics.contains(topic) ? _topics.remove(topic) : _topics.add(topic);
    notifyListeners();
    return _topics.contains(topic);
  }
}
