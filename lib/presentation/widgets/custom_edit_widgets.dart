import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/widgets/custom_text_decoration.dart';

import '../../config/colorConstant.dart';
import 'custom_text_style.dart';

class CustomEditField {
  static Widget getDropDown({required String title}) {
    return DropdownButtonFormField(
      value: "Train",
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hint: CustomTextStyle.regular(text: AppStrings.type),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
      ),
      items: AppStrings.journeyList.map((selected) {
        return DropdownMenuItem<String>(
          value: selected,
          child: CustomTextStyle.regular(text: selected),
        );
      }).toList(),
      onChanged: (value) {},
      validator: (value) {
        if (value == null) {
          return "Selection cannot be null";
        }
        return null;
      },
    );
  }

  static Widget getRemarkEditField(
      {required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      maxLines: 6,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: CustomTextDecoration.textFieldDecoration(
          labelText: AppStrings.remark),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.enterTextError;
        }
        return null;
      },
    );
  }

  static Widget getEditField({
    required TextEditingController controller,
    required IconData iconData,
    required String hintName,
    required bool isEnable,
  }) {
    return TextFormField(
        enabled: isEnable,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: CustomTextDecoration.textFieldDecorationSuffix(
            labelText: hintName, iconData: iconData),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return hintName;
          }
          return null;
        },
        onChanged: (value) {
          // BlocProvider.of<LoginBloc>(context)
          //     .add(TextChangeEvent(username.text, password.text));
        });
  }

  static Widget getEditFieldMaxLength(
      {required TextEditingController controller,
      required IconData suffix,
      required IconData prefix,
      required String hintName,
      required bool isEnable,
      required int length,
      bool? isVerified}) {
    return TextFormField(
        enabled: isEnable,
        controller: controller,
        maxLines: length,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            suffixIcon: isVerified == null
                ? Icon(suffix)
                : isVerified
                    ? const Icon(
                        Icons.check_circle,
                        color: AppColors.green800,
                      )
                    : Icon(suffix),
            labelText: hintName,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            prefixIcon: Icon(prefix)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return hintName;
          }
          return null;
        },
        onChanged: (value) {
          // BlocProvider.of<LoginBloc>(context)
          //     .add(TextChangeEvent(username.text, password.text));
        });
  }

  static Widget getEditFieldSuffixPrefix(
      {required TextEditingController controller,
      required IconData suffix,
      required IconData prefix,
      required String hintName,
      required bool isEnable,
      required int length,
      required ValueChanged<String>? onChanged}) {
    return TextFormField(
        enabled: isEnable,
        controller: controller,
        maxLines: length,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            suffixIcon: Icon(suffix),
            labelText: hintName,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            prefixIcon: Icon(prefix)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return hintName;
          }
          return null;
        },
        onChanged: onChanged);
  }
}
