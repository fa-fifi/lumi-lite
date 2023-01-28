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

  void updateTopic(TopicModel topic) {
    if (_topics.contains(topic)) {
      _topics.remove(topic);
    } else {
      _topics.add(topic);
    }
    debugPrint(_topics.length.toString());
    notifyListeners();
  }
}
