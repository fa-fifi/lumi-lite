import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';
import 'package:lumilite/screens/webview.dart';
import 'package:lumilite/widgets/favicon.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => WebViewScreen(news: news))),
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  Favicon(url: news.newsImage, radius: 48),
                  Favicon(url: news.publisherIcon),
                ]),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(news.publisherName,
                          style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: 3),
                      Text(news.newsTitle,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 10),
                      Text(news.updatedTime,
                          style: Theme.of(context).textTheme.bodySmall),
                      // Todo: Create hide news button.
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
