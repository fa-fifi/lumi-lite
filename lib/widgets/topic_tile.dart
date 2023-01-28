import 'package:flutter/material.dart';
import 'package:lumilite/models/settings.dart';
import 'package:lumilite/models/topic.dart';
import 'package:provider/provider.dart';

class TopicTile extends StatefulWidget {
  const TopicTile({
    Key? key,
    required this.topic,
    required this.isFollowing,
  }) : super(key: key);

  final TopicModel topic;
  final bool isFollowing;

  @override
  State<TopicTile> createState() => _TopicTileState();
}

class _TopicTileState extends State<TopicTile> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
      value: widget.isFollowing ? 1 : 0,
      duration: kThemeChangeDuration,
      vsync: this);

  late final Animation<double> scaleAnimation = TweenSequence<double>([
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 1.1), weight: 50),
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.1, end: 1), weight: 50)
  ]).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));

  @override
  void didUpdateWidget(covariant TopicTile oldWidget) {
    if (oldWidget.isFollowing != widget.isFollowing) {
      widget.isFollowing
          ? animationController.forward()
          : animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: scaleAnimation,
        builder: (contex, child) =>
            Transform.scale(scale: scaleAnimation.value, child: child),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
              backgroundColor: Theme.of(context)
                  .primaryColor
                  .withOpacity(widget.isFollowing ? 0.7 : 0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () =>
              context.read<SettingsModel>().updateTopic(widget.topic),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.topic.title,
                      style: widget.isFollowing
                          ? Theme.of(context).primaryTextTheme.bodyMedium
                          : Theme.of(context).textTheme.bodyMedium)),
              Align(
                alignment: Alignment.topRight,
                child: Checkbox(
                    shape: const CircleBorder(),
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => Colors.transparent),
                    value: widget.isFollowing,
                    onChanged: (_) => context
                        .read<SettingsModel>()
                        .updateTopic(widget.topic)),
              ),
            ],
          ),
        ),
      );
}
