import 'package:lumilite/models/topic.dart';

class NewsModel {
  final String newsTitle;
  final String publisherName;
  final String newsImage;
  final String publisherIcon;
  final String updatedTime;
  final String link;
  TopicModel topic;

  NewsModel({
    required this.newsTitle,
    required this.publisherName,
    required this.newsImage,
    required this.publisherIcon,
    required this.updatedTime,
    required this.link,
    this.topic = TopicModel.latest,
  });

  factory NewsModel.fromCsv(List<dynamic> csv) => NewsModel(
      newsTitle: csv[0],
      publisherName: csv[1],
      newsImage: csv[2],
      publisherIcon: csv[3],
      updatedTime: csv[5],
      link: csv[6]);
}
