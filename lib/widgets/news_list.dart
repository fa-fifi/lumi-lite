import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';
import 'package:lumilite/models/topic.dart';
import 'package:lumilite/services/csv.dart';
import 'package:lumilite/widgets/news_tile.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.topic});

  final TopicModel topic;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: CsvService.loadCsv(context, source: widget.topic.source),
      builder: (context, snapshot) => snapshot.hasData
          ? ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Visibility(
                  visible: index != 0,
                  child: NewsTile(
                      news: NewsModel.fromCsv(snapshot.data![index])
                        ..topic = widget.topic)))
          : Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.black12,
              color: Theme.of(context).primaryColor,
            )));
}
