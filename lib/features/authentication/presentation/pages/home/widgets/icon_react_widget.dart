import 'package:flutter/material.dart';

class IconReactWidget extends StatelessWidget {
  final String name;
  const IconReactWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Image.asset(name, width: 30, height: 30);
  }
}
