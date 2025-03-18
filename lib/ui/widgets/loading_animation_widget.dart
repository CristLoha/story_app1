import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimationWidget extends StatelessWidget {
  const LoadingAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/loading_animation.json',
        width: 130,
        height: 130,
        fit: BoxFit.cover,
      ),
    );
  }
}
