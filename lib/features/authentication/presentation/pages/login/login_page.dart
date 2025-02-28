import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app1/common/button_widget.dart';
import 'package:story_app1/common/widgets/logo_widget.dart';
import 'package:story_app1/common/widgets/text_field_widget.dart';
import 'package:story_app1/common/widgets/title_widget.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p100,
            horizontal: AppPadding.p24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              LogoWidget(),
              SizedBox(height: AppPadding.p100),
              TitleWidget(title: 'Log in to your\nAccount to continue'),
              SizedBox(height: AppPadding.p50),
              TextFieldWidget(hintText: 'Your Email', prefixIcon: Icons.email),
              SizedBox(height: AppPadding.p20),
              TextFieldWidget(
                hintText: 'Your Password',
                isPassword: true,
                prefixIcon: Icons.lock,
              ),
              SizedBox(height: 40),
              ButtonWidget(title: 'Login'),

              SizedBox(height: AppPadding.p60),
              Center(
                child: TextButton(
                  onPressed: () => context.go('/login/register'),
                  child: Text(
                    'Create New Account',
                    style: getGrey600TextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
