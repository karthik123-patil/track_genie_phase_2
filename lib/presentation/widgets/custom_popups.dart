import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/presentation/view/parent/bottom/parent_bottom.dart';
import '../../config/colorConstant.dart';
import 'custom_text_style.dart';

class CustomPopups {
  static final _sharedInstance = CustomPopups._internal();

  CustomPopups._internal();

  static CustomPopups getInstance() {
    return _sharedInstance;
  }

  Future<bool> closeAppDialog(BuildContext context) async {
    return (await showDialog(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?', style: TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2
        ),),
        content: const Text('Do you want to exit an App',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2
            )
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2
                )
            ),
          ),
          TextButton(
            onPressed: (){
              StorageUtil.instance.removeAll();
              exit(0);
            },
            child: const Text('Yes',
                style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2
                )
            ),
          ),
        ],
      ),
    )) ?? false;
  }

  Future<bool> onWillPop(BuildContext context) async {

    Navigator.pop(context);
    return true;
  }
}
