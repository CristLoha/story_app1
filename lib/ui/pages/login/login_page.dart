import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/ui/widgets/button_widget.dart';
import 'package:story_app1/ui/widgets/logo_widget.dart';
import 'package:story_app1/ui/widgets/text_field_widget.dart';
import 'package:story_app1/ui/widgets/title_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/static/auth_state.dart';
import 'package:story_app1/providers/login/auth_provider.dart';

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
                      _showErrorSnackbar(context, state.message);
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
          color: ColorsManager.primary,
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

  void _showErrorSnackbar(BuildContext context, String message) {
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
                            style: getRedTextStyle().copyWith(
                              fontSize: 16,
                              fontWeight: FontWeightManager.semiBold,
                              color: Colors.white,
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

    Future.delayed(const Duration(seconds: 3), () async {
      await controller.reverse();
      overlayEntry.remove();
    });
  }
}
