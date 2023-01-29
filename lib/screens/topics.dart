import 'package:flutter/material.dart';
import 'package:lumilite/providers/settings.dart';
import 'package:lumilite/models/topic.dart';
import 'package:lumilite/widgets/topic_tile.dart';
import 'package:provider/provider.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
              elevation: 0, titleSpacing: 0, title: const Text('Topics')),
          body: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: TopicModel.values
                .where((topic) => topic != TopicModel.latest)
                .length,
            itemBuilder: (context, index) {
              final TopicModel topic = TopicModel.values
                  .where((topic) => topic != TopicModel.latest)
                  .elementAt(index);
              final bool isFollowing =
                  context.watch<SettingsProvider>().topics.contains(topic);

              return TopicTile(topic: topic, isFollowing: isFollowing);
            },
          ),
        ),
      );
}
