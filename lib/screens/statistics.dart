import 'package:flutter/material.dart';
import 'package:lumilite/models/activity.dart';
import 'package:lumilite/widgets/favicon.dart';
import 'package:lumilite/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late final ActivityModel activity = context.read<ActivityModel>();

  Widget buildSection({required String title, Widget? child}) => Card(
        elevation: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold))),
          if (child != null) child,
        ]),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            elevation: 0, titleSpacing: 0, title: const Text('Statistics')),
        body: ListView(
          children: [
            if (activity.recentlyViewed != null)
              buildSection(
                  title: 'Recently Viewed',
                  child: NewsTile(news: activity.recentlyViewed!)),
            if (activity.topPublishers.isNotEmpty)
              buildSection(
                  title: 'Top Publishers',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...activity.topPublishers
                              .map((publisher) => Column(children: [
                                    Favicon(url: publisher.icon, radius: 48),
                                    const SizedBox(height: 10),
                                    Text(
                                        '${publisher.count} article${publisher.count > 1 ? 's' : ''}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ])),
                        ]),
                  )),
            if (activity.topCategory != null)
              buildSection(
                  title: 'Most Read Categories',
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Chip(label: Text(activity.topCategory!.title)))),
            buildSection(title: 'Total Reading Time'),
          ],
        ),
      );
}
