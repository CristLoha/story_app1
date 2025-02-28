import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/core/routes/app_route.dart';
import 'package:story_app1/core/theme_manager/theme_data_manager.dart';
import 'package:story_app1/providers/password_provider.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PasswordProvider())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Story App',
        theme: getApplicationThemeData(),
        routerConfig: appRouter,
      ),
    );
  }
}
