import 'package:flutter/material.dart';

import '../../config/constant.dart';
import 'custom_text_style.dart';

class CustomError {
  static Container buildNoConnectionContainer(
      BuildContext context, VoidCallback onTap) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextStyle.bold(text: Constant.noInternetMsg),
          const SizedBox(
            height: 16,
          ),
          CustomTextStyle.regular(text: Constant.noInternetDesc),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text(Constant.txtretry),
          )
        ],
      )),
    );
  }
}
