import 'package:flutter/material.dart';

import 'custom_text_style.dart';

class CustomContainer {
  static Container buildAtmStatusContainer({
    required String title1,
    String? title2,
    required String value1,
    required String value2,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextStyle.bold(text: value1, fontSize: 18),
                  CustomTextStyle.regular(text: title1, fontSize: 12),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Column(
                children: [
                  title2 != null
                      ? CustomTextStyle.bold(text: value2, fontSize: 18)
                      : Container(),
                  title2 != null
                      ? CustomTextStyle.regular(text: title2, fontSize: 12)
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
