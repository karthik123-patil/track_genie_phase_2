import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';


class CustomTextDecoration {
  static InputDecoration textFieldDecoration({String? labelText}) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      labelText: labelText,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
    );
  }

  static InputDecoration textFieldDecorationSuffix(
      {String? labelText, IconData? iconData}) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      prefixIcon: Icon(iconData),
      labelText: labelText,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
    );
  }

  static InputDecoration textFieldDecorationSuffixPostfix(
      {String? labelText, IconData? prefix, IconData? suffix}) {
    return InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        suffixIcon: Icon(suffix),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        prefixIcon: Icon(prefix));
  }

  static InputDecoration passwordFieldDecorationWithIcon(
      {Widget? suffixIcon,
      String? labelText,
      required bool isPasswordVisible,
      required VoidCallback onPasswordTap}) {
    return InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: onPasswordTap),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        prefixIcon: const Icon(Icons.key));
  }

  static InputDecoration dateFieldDecoration({String? labelText}) {
    return InputDecoration(
      suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_month),
        onPressed: () {},
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      labelText: labelText,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
    );
  }
}
