import 'package:flutter/material.dart';

import 'dart:math' show cos, sqrt, asin;

import 'package:track_genie_phase_2/presentation/widgets/custom_popups.dart';
import 'package:track_genie_phase_2/presentation/widgets/status_appbar.dart';


class ParentStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return CustomPopups.getInstance().closeAppDialog(context);
      },
      child: Scaffold(
        appBar: StatusAppBar(
          index: 0,
          strTxt: (String val) {
           // onClickOnLogout(val);
          },
        ),
        body: Container(child: Text("data"),),
      ),
    );

  }

}
