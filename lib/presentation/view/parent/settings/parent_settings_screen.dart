import 'dart:io';

import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/parent_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class ParentSettingScreen extends StatelessWidget {
  const ParentSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        exit(1);
      },
      child: Scaffold(
        appBar: const ParentAppBar(
          index: 3,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(routeStudentInfo);
                },
                title: Text(
                  AppStrings.settStudentInfo,
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  AppStrings.settStudentDetails,
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset(
                  AppStrings.forwardImage,
                  scale: 1.5,
                ),
              ),
              const Divider(
                thickness: 1.5,
                color: AppColors.dividerColor,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(routeNotificationSetting);
                },
                title: Text(
                  AppStrings.settNotification,
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  AppStrings.settNotificationDetails,
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset(
                  AppStrings.forwardImage,
                  scale: 1.5,
                ),
              ),
              const Divider(
                thickness: 1.5,
                color: AppColors.dividerColor,
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  AppStrings.settScheduleLeave,
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  AppStrings.settScheduleLeaveDetails,
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset(
                  AppStrings.forwardImage,
                  scale: 1.5,
                ),
              ),
              const Divider(
                thickness: 1.5,
                color: AppColors.dividerColor,
              ),
              ListTile(
                onTap: () {

                },
                title: Text(
                  AppStrings.settCancelLeave,
                  style: AppTextStyles.studentNameTextStyle,
                ),
                subtitle: Text(
                  AppStrings.settCancelLeaveDetails,
                  style: AppTextStyles.dynamicValuesStyle,
                ),
                trailing: Image.asset(
                  AppStrings.forwardImage,
                  scale: 1.5,
                ),
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
