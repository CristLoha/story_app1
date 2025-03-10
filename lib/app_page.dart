import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/home/post_interaction_provider.dart';
import 'package:story_app1/static/app_route.dart';
import 'package:story_app1/providers/home/stories_list_provider.dart';
import 'package:story_app1/utils/theme_manager/theme_data_manager.dart';
import 'package:story_app1/providers/login/auth_provider.dart';
import 'package:story_app1/providers/login/password_provider.dart';
import 'package:story_app1/providers/uploadpost/upload_post_provider.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => StoriesListProvider()),
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
        ChangeNotifierProvider(create: (_) => UploadPostProvider()),
        ChangeNotifierProvider(create: (_) => PostInteractionProvider()),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Story App',
        theme: getApplicationThemeData(),
        routerConfig: appRouter,
      ),
    );
  }
}
