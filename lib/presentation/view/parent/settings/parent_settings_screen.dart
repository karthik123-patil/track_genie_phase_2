import 'dart:io';

import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/parent_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';
class ParentSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: (){

        Navigator.pop(context);
        exit(1);
      },
      child: Scaffold(
        appBar: const ParentAppBar(index: 3,),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  Navigator.of(context).pushNamed(routeStudentInfo);
                },
                title: Text(
                  "Student Information",
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  "Your childs information as per school records",
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset('assets/images/small_forward_img.png', scale: 1.5,),
              ),
              const Divider(
                thickness: 1.5,
                color: AppColors.dividerColor,
              ),
              /*ListTile(
                onTap: (){
                  Navigator.of(context).pushNamed("/NotificationSettingsScreen");
                },
                title: Text(
                  "Notification Settings",
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  "Choose your notification preferences",
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset('assets/images/small_forward_img.png', scale: 1.5,),
              ),
              const Divider(
                thickness: 1.5,
                color: AppColors.dividerColor,
              ),*/

              ListTile(
                onTap: (){

                },
                title: Text(
                  "Schedule Leave",
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  "Schedule your leave preferences",
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset('assets/images/small_forward_img.png', scale: 1.5,),
              ),
              const Divider(
                thickness: 1.5,
                color: AppColors.dividerColor,
              ),

              ListTile(
                onTap: (){

                },
                title: Text(
                  "Cancel Scheduled Leave",
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  "Cancel Scheduled your leave preferences",
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset('assets/images/small_forward_img.png', scale: 1.5,),
              ),
              const Divider(
                thickness: 1.5,
                color: AppColors.dividerColor,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
