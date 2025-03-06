import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';

class SnackbarWidget {
  static void showError(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final controller = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    );
    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: Offset.zero,
                ).animate(animation),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsManager.secondary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: ColorsManager.grey900,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/lottie/error_animation.json',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            message,
                            style: getWhiteTextStyle().copyWith(
                              fontSize: 16,
                              fontWeight: FontWeightManager.semiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);
    controller.forward();

    Future.delayed(const Duration(seconds: 2), () async {
      await controller.reverse();
      overlayEntry.remove();
    });
  }
}
