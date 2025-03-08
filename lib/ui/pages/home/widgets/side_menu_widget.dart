import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app1/services/sesion_manager.dart';
import 'package:story_app1/ui/widgets/logo_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';

class SideMenuWidget extends StatelessWidget {
  final SessionManager sesionManager;

  const SideMenuWidget({super.key, required this.sesionManager});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.white,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: ColorsManager.white),
            child: LogoWidget(crossAxisAlignment: CrossAxisAlignment.start),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Change Language"),
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text("Feature Unavailable"),
                      content: Text("This feature is not available yet."),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(),
                          child: Text("OK"),
                        ),
                      ],
                    ),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.logout, color: ColorsManager.secondary),
            title: Text("Log out"),
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text("Log out of your account?"),
                      contentPadding: EdgeInsets.only(
                        top: 20,
                        left: 24,
                        right: 24,
                      ),
                      actions: [
                        Column(
                          children: [
                            Divider(height: 3, color: ColorsManager.grey300),
                            TextButton(
                              onPressed: () async {
                                final router = GoRouter.of(context);

                                await sesionManager.clearSession();

                                if (context.mounted) {
                                  router.go('/login');
                                }
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: ColorsManager.secondary,
                                textStyle: TextStyle(fontSize: AppSize.s16),
                              ),
                              child: Text("Log out"),
                            ),
                            Divider(height: 2, color: ColorsManager.grey300),

                            TextButton(
                              onPressed: () => context.pop(),

                              style: TextButton.styleFrom(
                                foregroundColor: ColorsManager.grey900,

                                textStyle: TextStyle(fontSize: 16),
                              ),
                              child: Text("Cancel"),
                            ),
                          ],
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
