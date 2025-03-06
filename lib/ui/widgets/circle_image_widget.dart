import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String url;
  final double radius;
  const CircleImageWidget({super.key, required this.url, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        width: 55,
        height: 55,
        imageUrl: url,
        progressIndicatorBuilder:
            (context, url, progress) =>
                CircularProgressIndicator(value: progress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
