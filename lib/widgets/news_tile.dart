import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lumilite/models/news.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48),
                      child: CachedNetworkImage(
                          imageUrl: news.newsImage, fit: BoxFit.cover),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(15),
                      child: CachedNetworkImage(
                          imageUrl: news.publisherIcon, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
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
      );
}
