import 'dart:async';

import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  late int hour = DateTime.now().hour;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1),
        (timer) => setState(() => hour = DateTime.now().hour));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hour >= 6 && hour < 12
                  ? 'Good morning'
                  : hour >= 12 && hour < 14
                      ? 'Good afternoon'
                      : hour >= 14 && hour < 18
                          ? 'Good evening'
                          : 'Good night',
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(
              hour >= 6 && hour < 12
                  ? 'Catch up on news you’ve missed'
                  : hour >= 12 && hour < 14
                      ? ''
                      : hour >= 14 && hour < 18
                          ? 'Here’s what you’ve missed'
                          : ' Have a good rest!',
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}
