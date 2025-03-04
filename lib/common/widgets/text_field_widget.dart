import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';
import 'package:story_app1/providers/password_provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  const TextFieldWidget({
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordProvider>(
      builder: (context, passProvider, child) {
        return TextField(
          controller: controller,
          obscureText: isPassword ? passProvider.isObscure : false,
          onChanged: onChanged,
          keyboardType: keyboardType,
          cursorColor: ColorsManager.primary,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,

            hintStyle: getGrey900TextStyle(
              fontSize: FontSizeManager.f14,
              fontWeight: FontWeightManager.regular,
            ),
            prefixIcon: Icon(prefixIcon, color: ColorsManager.grey900),
            suffixIcon:
                isPassword
                    ? IconButton(
                      onPressed: passProvider.toggleVisibility,
                      icon: Icon(
                        passProvider.isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      color: ColorsManager.grey900,
                    )
                    : null,
            fillColor: ColorsManager.softWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s14),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
        );
      },
    );
  }
}
