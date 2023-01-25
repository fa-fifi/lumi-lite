class NewsModel {
  final String newsTitle;
  final String publisherName;
  final String newsImage;
  final String publisherIcon;
  final String updatedTime;
  final String link;

  const NewsModel(
      {required this.newsTitle,
      required this.publisherName,
      required this.newsImage,
      required this.publisherIcon,
      required this.updatedTime,
      required this.link});

  factory NewsModel.fromCsv(List<dynamic> csv) => NewsModel(
      newsTitle: csv[0],
      publisherName: csv[1],
      newsImage: csv[2],
      publisherIcon: csv[3],
      updatedTime: csv[5],
      link: csv[6]);
}

// class BlockModel {
//   String recognizedText;
//   String translatedText;
//   Rect boundingBox;
//   List<Offset> cornerPoints;
//   int region;

//   BlockModel(
//       {required this.recognizedText,
//       required this.translatedText,
//       required this.boundingBox,
//       required this.cornerPoints,
//       this.region = 0});

//   factory BlockModel.fromTextBlock(TextBlock textBlock) => BlockModel(
//       recognizedText: textBlock.lines.map((line) => line.text).join('\n'),
//       translatedText: '',
//       boundingBox: textBlock.boundingBox,
//       cornerPoints: List.from(textBlock.cornerPoints
//           .map((point) => Offset(point.x.toDouble(), point.y.toDouble()))),
//       region: 0);

//   Axis get axis => (cornerPoints[1] - cornerPoints[0]).direction > pi / 4
//       ? Axis.vertical
//       : Axis.horizontal;

//   int get lines => '\n'.allMatches(recognizedText).length + 1;

//   double get radian => cornerPoints.length > 4
//       ? (boundingBox.topRight - boundingBox.topLeft).direction
//       : axis == Axis.vertical
//           ? (cornerPoints.first - cornerPoints.last).direction
//           : (cornerPoints[1] - cornerPoints.first).direction;

//   double get fontSize =>
//       (axis == Axis.horizontal ? boundingBox.height : boundingBox.width) /
//       lines;
// }
