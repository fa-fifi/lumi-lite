import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';
import 'package:lumilite/widgets/news_tile.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.csv});

  final String csv;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Future<List<List<dynamic>>> loadCsv() async {
    var result = await DefaultAssetBundle.of(context).loadString(widget.csv);
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: loadCsv(),
      builder: (context, snapshot) => snapshot.hasData
          ? ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Visibility(
                  visible: index != 0,
                  child:
                      NewsTile(news: NewsModel.fromCsv(snapshot.data![index]))))
          // Todo: Create loading screen.
          : const CircularProgressIndicator());
}
