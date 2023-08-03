import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/notification_setting_bloc.dart';
import 'package:track_genie_phase_2/presentation/widgets/custom_popups.dart';
import 'package:track_genie_phase_2/presentation/widgets/notification_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

import '../../../../domain/model/notification_setting.dart';

class NotificationSettingsScreen extends StatelessWidget {
   const NotificationSettingsScreen({super.key});


   static List<NotificationSettingModel> listData = [
     NotificationSettingModel(
         title: AppStrings.strBusArrived,
         key: 'enable_WhenBusArrivedAtSchool',
         value: false),
     NotificationSettingModel(
         title: AppStrings.strBusLeft,
         key: 'enable_WhenBusLeftSchool',
         value: false),
     NotificationSettingModel(
         title: AppStrings.strBusArrivedAtHome,
         key: 'enable_WhenBusArrivedAtYourHome',
         value: false),
     NotificationSettingModel(
         title: AppStrings.strWhenBusLeftHome,
         key: 'enable_WhenBusLeftYourHome',
         value: false),
     NotificationSettingModel(
         title: AppStrings.strBusNearbyHome,
         key: 'enable_WhenBusIsNearByMyHome',
         value: false)
   ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return CustomPopups.getInstance().onWillPop(context);
      },
      child: Scaffold(
        appBar: const NotificationAppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /*ListTile(
                  title: Text(
                    AppStrings.strSetBusAddress,
                    style: AppTextStyles.detailsTextStyle,
                  ),
                  subtitle: Text(
                    AppStrings.strSetLocation,
                    style: AppTextStyles.setLocationStyle,
                  ),
                  trailing: Image.asset(
                    AppStrings.forwardImage,
                    scale: 1.5,
                  ),
                ),*/
                /*Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.strNotificationSetting,
                        style: AppTextStyles.notificationTextStyle,
                      ),
                    ],
                  ),
                ),*/
                const SizedBox(height: 20,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listData.length,
                  itemBuilder: (BuildContext context, int listIndex) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            listData[listIndex].title,
                            style: AppTextStyles.detailsTextStyle,
                          ),
                          trailing: ToggleSwitch(
                            minWidth: 40.0,
                            cornerRadius: 20.0,
                            activeBgColors: [
                              [Colors.green[800]!],
                              [Colors.red[800]!]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: const ['on', 'off'],
                            radiusStyle: true,
                            onToggle: (index) {
                              if (kDebugMode) {
                                print('switched to: $index');
                              }
                              if (index == 0) {
                                listData[listIndex].value = true;
                              } else {
                                listData[listIndex].value = false;
                              }

                              context
                                  .read<NotificationSettingCubit>()
                                  .switchModeSetting(listData[listIndex]);
                            },
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                          color: AppColors.dividerColor,
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
