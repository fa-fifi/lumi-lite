import 'package:flutter/material.dart';
import 'package:lumilite/models/activity.dart';
import 'package:lumilite/models/news.dart';
import 'package:lumilite/widgets/favicon.dart';
import 'package:lumilite/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.news});

  final NewsModel news;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() => loadingPercentage = 0);
        },
        onProgress: (progress) {
          setState(() => loadingPercentage = progress);
        },
        onPageFinished: (url) {
          setState(() => loadingPercentage = 100);
          if (!mounted) return;
          Provider.of<ActivityModel>(context, listen: false)
              .addHistory(widget.news);
          ScaffoldMessenger.of(context).showSnackBar(
              Snackbar.floating('Ads from the publisher’s website'));
          if (Provider.of<ActivityModel>(context, listen: false)
                  .history
                  .length ==
              5) {
            ScaffoldMessenger.of(context).showSnackBar(Snackbar.floating(
                'Congratulations, you have viewed 5 articles! 🎉'));
          } else if (Provider.of<ActivityModel>(context, listen: false)
                  .history
                  .length ==
              10) {
            ScaffoldMessenger.of(context).showSnackBar(
                Snackbar.floating('Wow, you are an avid news reader! 🏆'));
          }
        },
      ))
      ..loadRequest(Uri.parse(widget.news.link));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Row(
              children: [
                Favicon(url: widget.news.publisherIcon),
                const SizedBox(width: 10),
                Text(widget.news.publisherName,
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
          body: Stack(
            children: [
              WebViewWidget(controller: controller),
              if (loadingPercentage < 100)
                LinearProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    value: loadingPercentage / 100.0),
            ],
          ),
        ),
      );
}
