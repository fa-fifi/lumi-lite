import 'package:flutter/material.dart';
import 'package:lumilite/screens/landing.dart';
import 'package:lumilite/screens/statistics.dart';
import 'package:lumilite/screens/topics.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  ListTile buildListTile(BuildContext context,
          {required String text, required VoidCallback onTap}) =>
      ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        title: Text(text),
        trailing: const Icon(Icons.chevron_right),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('Settings')),
        body: ListView(
          controller: LandingScreenState.controller,
          padding: const EdgeInsets.all(8),
          children: [
            buildListTile(context,
                text: 'Topics  🗂️',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopicsScreen()))),
            const SizedBox(height: 8),
            buildListTile(context,
                text: 'Statistics  📊',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StatisticsScreen()))),
          ],
        ),
      );
}
