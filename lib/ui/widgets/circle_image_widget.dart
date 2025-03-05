import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String url;
  final double radius;
  const CircleImageWidget({super.key, required this.url, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: NetworkImage(url));
  }
}
