import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/input-border.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class VehicleScheduledScreen extends StatelessWidget {
  const VehicleScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppUtils.whiteSystemTheme,
      child: WillPopScope(
        onWillPop: () {
          exit(0);
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.whiteColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /* isOffline ? AppUtils().k60Height : AppUtils().k0Height,
                  isOffline ? Container(
                    child: AppUtils().internetWidget("No Internet Connection Available", isOffline),
                  ): Container(),
                  isOnline ? AppUtils().k60Height : AppUtils().k0Height,
                  isOnline ? Container(
                    child: AppUtils().internetAvailableWidget("Back to online", isOffline),
                  ): Container(),*/
                  AppUtils().k30Height,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed(routeLogin),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColors.blackColor,
                              size: 30,
                            )),
                      ),
                      Expanded(
                        flex: 9,
                        child: Image.asset(
                          AppStrings.appContentImage,
                          scale: 1.6,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.strStartTheTrip,
                          style: AppTextStyles.registerAsStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, top: 30, bottom: 12),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.strAdminAssigned,
                          style: AppTextStyles.createAcctStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18.0, top: 30),
                    child: Row(
                      children: [
                        // true ? Expanded(
                        //   child: DropdownButtonFormField(
                        //     isExpanded: true,
                        //     decoration: InputDecoration(
                        //       label: Text("Schedule", style: AppTextStyles.studentNameTextStyle,),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: const BorderSide(color: Colors.black, width: 2),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderSide: const BorderSide(color: Colors.black, width: 2),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       filled: true,
                        //       fillColor: Colors.white,
                        //     ),
                        //     dropdownColor: Colors.white, items: [],
                        //     onChanged: (Object? value) {  },
                        //     // value: selectedValue,
                        //     // items: scheduleList.map((item) {
                        //     //   return DropdownMenuItem(
                        //     //     value: item['scheduleName']
                        //     //         .toString(),
                        //     //     child: Text(
                        //     //       item['scheduleName']
                        //     //           .toString(),
                        //     //       style: const TextStyle(
                        //     //           color: Colors.black),
                        //     //     ),
                        //     //   );
                        //     // }).toList(),
                        //     // hint:const Text(
                        //     //   "Select Schedule",
                        //     //   style: TextStyle(
                        //     //       color: Colors.black,
                        //     //       fontSize: 14,
                        //     //       fontWeight: FontWeight.w500),
                        //     // ),
                        //     // onChanged: (String? value) {
                        //     //   setState(() {
                        //     //     for (var element in scheduleList) {
                        //     //       if (element['scheduleName']
                        //     //           .toString() ==
                        //     //           value) {
                        //     //         strScheduleId = element['scheduleId']
                        //     //             .toString();
                        //     //       }
                        //     //     }
                        //     //     StorageUtil.instance.setStringValue(AppStrings.strPrefVehicleScheduleId, strScheduleId.toString());
                        //     //   });
                        //     // },
                        //   ),
                        // ):
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            style: AppTextStyles.createAcctStyle,
                            decoration: InputDecoration(
                                hintText: "Schedule is not assigned",
                                hintStyle: AppTextStyles.hintTextStyle,
                                errorBorder: InPutBorders.errorBorders,
                                focusedBorder: InPutBorders.focusBorders,
                                enabledBorder: InPutBorders.enableBorders,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: 150,
                        //   child: ElevatedButton(
                        //     onPressed: strScheduleId!.isNotEmpty ? () async{
                        //       startTheTrip();
                        //     } : null,
                        //     style: ElevatedButton.styleFrom(
                        //         padding: const EdgeInsets.symmetric(vertical: 13),
                        //         backgroundColor: AppColors.bgColor,
                        //         elevation: 2,
                        //         shape: const RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.all(Radius.circular(10))
                        //         )
                        //     ),
                        //     child: isCircular? const SizedBox(
                        //       height: 30,
                        //       width: 30,
                        //       child: CircularProgressIndicator(
                        //         color: AppColors.blackColor,
                        //         strokeWidth: 1,
                        //       ),
                        //     ): Text(AppStrings.strStartTrip,
                        //       style: AppTextStyles.btnTextStyle,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
