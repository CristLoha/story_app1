import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/common/button_widget.dart';
import 'package:story_app1/common/widgets/logo_widget.dart';
import 'package:story_app1/common/widgets/text_field_widget.dart';
import 'package:story_app1/common/widgets/title_widget.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';
import 'package:story_app1/providers/password_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordProvider = Provider.of<PasswordProvider>(context);
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
              TitleWidget(title: 'Register Now &\nGet Started'),
              SizedBox(height: AppPadding.p50),
              TextFieldWidget(hintText: 'Your Name', prefixIcon: Icons.person),
              SizedBox(height: AppPadding.p20),
              TextFieldWidget(hintText: 'Your Email', prefixIcon: Icons.email),
              SizedBox(height: AppPadding.p20),
              TextFieldWidget(
                hintText: 'Your Password',
                isPassword: true,
                prefixIcon: Icons.lock,
                onChanged: passwordProvider.checkPasswordStrength,
              ),
              SizedBox(height: AppPadding.p10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (passwordProvider.passwordStrength.isNotEmpty) ...[
                    Text(
                      passwordProvider.passwordStrength,
                      style: getGrey600TextStyle().copyWith(
                        color: passwordProvider.strengthColor,
                        fontSize: FontSizeManager.f14,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                    const SizedBox(height: AppPadding.p4),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 5,
                      width:
                          MediaQuery.of(context).size.width *
                          (passwordProvider.passwordStrength == 'Weak'
                              ? 0.3
                              : passwordProvider.passwordStrength == 'Medium'
                              ? 0.6
                              : 1.0),

                      decoration: BoxDecoration(
                        color: passwordProvider.strengthColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 40),
              ButtonWidget(title: 'Register'),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: getGrey600TextStyle(),
                  ),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: Text(
                      'Login',
                      style: getOrangeTextStyle(fontSize: FontSizeManager.f16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
