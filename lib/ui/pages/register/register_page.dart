import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/login/auth_provider.dart';
import 'package:story_app1/static/register_result_state.dart';
import 'package:story_app1/ui/widgets/button_widget.dart';
import 'package:story_app1/ui/widgets/logo_widget.dart';
import 'package:story_app1/ui/widgets/snackbar_widget.dart';
import 'package:story_app1/ui/widgets/text_field_widget.dart';
import 'package:story_app1/ui/widgets/title_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
    nameC.dispose();
    passC.dispose();
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
            TitleWidget(title: 'Register Now &\nGet Started'),
            SizedBox(height: AppPadding.p50),

            _buildRegisterForm(),

            SizedBox(height: AppPadding.p20),

            Consumer<AuthProvider>(
              builder: (context, provider, _) {
                final isLoading =
                    provider.registerStete is RegisterLoadingState;

                if (provider.registerStete is RegisterErrorState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    SnackbarWidget.showError(
                      context,
                      (provider.registerStete as RegisterErrorState).message,
                    );
                  });
                }

                return ButtonWidget(
                  title: 'Register',
                  isLoading: isLoading,

                  onPressed:
                      isLoading
                          ? null
                          : () async {
                            final navigator = GoRouter.of(context);
                            await provider.register(
                              nameC.text,
                              emailC.text,
                              passC.text,
                            );
                            if (provider.registerStete
                                is RegisterSuccessState) {
                              if (mounted) {
                                navigator.go('/login');
                              }
                            }
                          },
                );
              },
            ),

            SizedBox(height: AppPadding.p60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: getGrey600TextStyle()),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    'Login',
                    style: getGrey600TextStyle().copyWith(
                      color: ColorsManager.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          hintText: 'Your Name',
          prefixIcon: Icons.person,
          controller: nameC,
        ),
        SizedBox(height: AppPadding.p20),
        TextFieldWidget(
          hintText: 'Your Email',
          prefixIcon: Icons.email,
          controller: emailC,
        ),
        SizedBox(height: AppPadding.p20),
        TextFieldWidget(
          hintText: 'Your Password',
          isPassword: true,
          prefixIcon: Icons.lock,
          controller: passC,
        ),
      ],
    );
  }
}
