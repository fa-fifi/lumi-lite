import 'package:flutter/material.dart';
import 'package:lumilite/models/topic.dart';

class SettingsModel extends ChangeNotifier {
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
    if (_topics.contains(topic)) {
      _topics.remove(topic);
      notifyListeners();
      return false;
    } else {
      _topics.add(topic);
      notifyListeners();
      return true;
    }
  }
}
