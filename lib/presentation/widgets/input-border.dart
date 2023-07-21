import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';

class InPutBorders {
  static OutlineInputBorder errorBorders = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
        color: AppColors.redColor
    ),
  );

  static OutlineInputBorder focusBorders = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
        color: AppColors.blackColor
    ),
  );

  static OutlineInputBorder enableBorders = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
        color: AppColors.blackColor
    ),
  );
}