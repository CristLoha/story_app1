import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/theme_data_manager.dart';
import 'package:story_app1/features/authentication/presentation/pages/login/login_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Story App',
      theme: getApplicationThemeData(),
      home: const LoginPage(),
    );
  }
}
