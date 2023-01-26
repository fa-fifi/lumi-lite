import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Favicon extends StatelessWidget {
  const Favicon({super.key, required this.url, this.radius = 15});

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox.fromSize(
            size: Size.fromRadius(radius),
            child: CachedNetworkImage(imageUrl: url, fit: BoxFit.cover)),
      );
}
