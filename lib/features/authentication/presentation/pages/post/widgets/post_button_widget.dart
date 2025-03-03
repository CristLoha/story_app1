import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';

class PostButtonWidget extends StatelessWidget {
  const PostButtonWidget({
    super.key,
    required this.isButtondisabled,
  });

  final bool isButtondisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        right: 10,
      ),
      child: FloatingActionButton(
        onPressed: isButtondisabled ? null : () {},
        backgroundColor:
            isButtondisabled ? ColorsManager.grey500 : ColorsManager.primary,
        child: Icon(Icons.send, color: ColorsManager.white),
      ),
    );
  }
}
