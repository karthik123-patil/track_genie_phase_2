import 'package:flutter/material.dart';

class CustomTextStyle {
  static Widget extraBold({String? text, double? fontSize, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }

  static Widget bold({String? text, double? fontSize, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      softWrap: false,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget semiBold(
      {required String text, double? fontSize, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget regular(
      {String? text, double? fontSize, Color? color, int? maxLines}) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      maxLines: maxLines,
    );
  }

  static Widget italic(
      {String? text, double? fontSize, Color? color, int? maxLines}) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: FontStyle.italic),
      maxLines: maxLines,
    );
  }
}
