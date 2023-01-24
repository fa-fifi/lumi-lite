import 'dart:async';

import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  late int hour = DateTime.now().hour;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1),
        (timer) => setState(() => hour = DateTime.now().hour));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hour < 12 && hour >= 6
                ? 'Good morning'
                : hour < 14 && hour >= 12
                    ? 'Good afternoon'
                    : hour < 18 && hour >= 14
                        ? 'Good evening'
                        : 'Good night'),
            Text(hour < 12 && hour >= 6
                ? 'Catch up on news you’ve missed'
                : hour < 14 && hour >= 12
                    ? ''
                    : hour < 18 && hour >= 14
                        ? 'Here’s what you’ve missed'
                        : ' Have a good rest!'),
          ],
        ),
      );
}
