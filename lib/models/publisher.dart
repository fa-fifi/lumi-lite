class PublisherModel {
  final String name;
  final String icon;
  int count;

  PublisherModel({
    required this.name,
    required this.icon,
    this.count = 0,
  });
}
