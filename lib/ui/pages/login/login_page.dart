import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/ui/widgets/button_widget.dart';
import 'package:story_app1/ui/widgets/logo_widget.dart';
import 'package:story_app1/ui/widgets/text_field_widget.dart';
import 'package:story_app1/ui/widgets/title_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/static/auth_state.dart';
import 'package:story_app1/providers/auth_provider.dart';

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
              Selector<AuthProvider, AuthState>(
                selector: (context, provider) => provider.state,
                builder: (context, state, child) {
                  if (state is AuthErrorState) {
                    // Tampilkan dialog error jika ada pesan error dari API
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _showErrorDialog(context, state.message);
                    });
                  }
                  return _buildLoginForm(context.read<AuthProvider>());
                },
              ),
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

  Widget _buildLoginForm(AuthProvider authProvider) {
    final isLoading = authProvider.state is AuthLoadingState;

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
        SizedBox(height: AppPadding.p20),
        ButtonWidget(
          title: 'Login',
          isLoading: isLoading,
          onPressed:
              isLoading
                  ? null
                  : () async {
                    await authProvider.login(_emailC.text, _passC.text);
                    if (authProvider.state is AuthSuccessState) {
                      if (mounted) {
                        context.go('/home');
                      }
                    }
                  },
        ),
      ],
    );
  }

  /// Menampilkan dialog error dengan pesan dari API
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // Tidak bisa ditutup dengan klik di luar
      builder: (context) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeInOut,
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Column(
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 50),
                const SizedBox(height: 10),
                Text('Oops! Something went wrong', style: getRedTextStyle()),
              ],
            ),
            content: Text(
              message,
              style: getGrey900TextStyle(),
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}
