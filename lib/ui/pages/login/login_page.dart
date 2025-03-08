import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/login/auth_provider.dart';
import 'package:story_app1/static/login_result_state.dart';

import 'package:story_app1/ui/widgets/button_widget.dart';
import 'package:story_app1/ui/widgets/logo_widget.dart';
import 'package:story_app1/ui/widgets/snackbar_widget.dart';
import 'package:story_app1/ui/widgets/text_field_widget.dart';
import 'package:story_app1/ui/widgets/title_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            _buildLoginForm(),

            SizedBox(height: AppPadding.p20),

            Consumer<AuthProvider>(
              builder: (context, provider, _) {
                final isLoading = provider.loginState is LoginLoadingState;
                if (provider.loginState is LoginErrorState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    SnackbarWidget.showError(
                      context,
                      (provider.loginState as LoginErrorState).message,
                    );

                    provider.resetState();
                  });
                }

                return ButtonWidget(
                  title: 'Login',

                  isLoading: isLoading,
                  onPressed:
                      isLoading
                          ? null
                          : () async {
                            final navigator = GoRouter.of(context);
                            await provider.login(_emailC.text, _passC.text);
                            if (mounted) {
                              navigator.go('/home');
                            }
                          },
                );
              },
            ),

            SizedBox(height: AppPadding.p60),
            Center(
              child: TextButton(
                onPressed: () {
                  context.go('/login/register');
                },
                child: Text('Create New Account', style: getGrey600TextStyle()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        TextFieldWidget(
          controller: _emailC,
          hintText: 'Your Email',
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: AppPadding.p20),
        TextFieldWidget(
          controller: _passC,
          hintText: 'Your Password',
          isPassword: true,
          prefixIcon: Icons.lock,
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
