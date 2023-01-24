import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';

class CategoryModel extends ChangeNotifier {
  final List<NewsModel> _latest = [
    const NewsModel(
        newsImage: 'newsImage',
        newsTitle: 'latest',
        publisherName: 'publisherName',
        publisherIcon: 'publisherIcon',
        updatedTime: 'updatedTime',
        link: 'link')
  ];
  final List<NewsModel> _trending = [
    const NewsModel(
        newsImage: 'newsImage',
        newsTitle: 'trending',
        publisherName: 'publisherName',
        publisherIcon: 'publisherIcon',
        updatedTime: 'updatedTime',
        link: 'link')
  ];
  final List<NewsModel> _news = [
    const NewsModel(
        newsImage: 'newsImage',
        newsTitle: 'news',
        publisherName: 'publisherName',
        publisherIcon: 'publisherIcon',
        updatedTime: 'updatedTime',
        link: 'link')
  ];

  UnmodifiableListView<NewsModel> get latest => UnmodifiableListView(_latest);
  UnmodifiableListView<NewsModel> get trending =>
      UnmodifiableListView(_trending);
  UnmodifiableListView<NewsModel> get news => UnmodifiableListView(_news);
}
