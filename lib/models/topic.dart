enum TopicModel {
  latest('Latest ⚡', 'assets/data/latest.csv'),
  trending('Trending 🔥', 'assets/data/trending.csv'),
  news('News ☕', 'assets/data/news.csv');

  const TopicModel(this.title, this.source);
  final String title, source;

  @override
  String toString() => 'TopicModel($title, $source)';
}
