import 'package:flutter/material.dart';
import 'package:lumilite/models/settings.dart';
import 'package:lumilite/models/topic.dart';
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

            return TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                  backgroundColor: Theme.of(context)
                      .primaryColor
                      .withOpacity(isFollowing ? 0.7 : 0.1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () => context.read<SettingsModel>().updateTopic(topic),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(topic.title,
                          style: isFollowing
                              ? Theme.of(context).primaryTextTheme.bodyMedium
                              : Theme.of(context).textTheme.bodyMedium)),
                  Align(
                    alignment: Alignment.topRight,
                    child: Checkbox(
                        shape: const CircleBorder(),
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (states) => Colors.transparent),
                        value: isFollowing,
                        onChanged: (_) =>
                            context.read<SettingsModel>().updateTopic(topic)),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
