import 'package:flutter/material.dart';
import 'package:lumilite/models/settings.dart';
import 'package:lumilite/models/topic.dart';
import 'package:lumilite/widgets/topic_tile.dart';
import 'package:provider/provider.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            AppBar(elevation: 0, titleSpacing: 0, title: const Text('Topics')),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 9 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: TopicModel.values.length - 1,
          itemBuilder: (context, index) {
            final TopicModel topic = TopicModel.values[index + 1];
            final bool isFollowing =
                context.watch<SettingsModel>().topics.contains(topic);

            return TopicTile(topic: topic, isFollowing: isFollowing);
          },
        ),
      );
}
