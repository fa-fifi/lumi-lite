class NewsModel {
  final String newsImage;
  final String newsTitle;
  final String publisherName;
  final String publisherIcon;
  final String updatedTime;
  final String link;

  const NewsModel(
      {required this.newsImage,
      required this.newsTitle,
      required this.publisherName,
      required this.publisherIcon,
      required this.updatedTime,
      required this.link});
}
