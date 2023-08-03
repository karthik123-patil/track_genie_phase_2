import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/Helper.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/schedule_event.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/parent_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

import '../../../../config/shared_preferences.dart';
import '../../../bloc_logic/bloc/parent/setting/schedule_leave_bloc.dart';
import '../../../bloc_logic/state/CommonState.dart';
import '../../../widgets/input-border.dart';

class ParentSettingScreen extends StatelessWidget {
    ParentSettingScreen({super.key});

  String? selectedValue, strJourneyId = '';
  DateTime initialDate = DateTime.now();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final typeOfJourney = [
      'Onward',
      'Backward',
      'Both'
    ];
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
                onTap: () {
                  _scheduleLeaveDialog(context);
                },
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
                  _cancelLeaveDialog(context);
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

    Future<void> _selectLeaveDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: initialDate,
        lastDate: DateTime(2095, 1),
      );
      if (picked != null && picked != initialDate) {
        fromDate = picked;
        _dateController.text = fromDate.toString().substring(0, 10);
      }
    }

    Future<void> _selectToLeaveDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: initialDate,
        lastDate: DateTime(2095, 1),
      );
      if (picked != null && picked != initialDate) {
        toDate = picked;
        _toDateController.text = toDate.toString().substring(0, 10);
      }
    }

    Future<bool> _scheduleLeaveDialog(BuildContext context) async {
      return (await showDialog(
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => Dialog(
          child: BlocProvider(
            create: (context) => ScheduleLeaveBloc(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 350,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Schedule Leave',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2),
                        ),
                        Divider(
                          color: AppColors.blackColor,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              label: Text("Schedule", style: AppTextStyles.studentNameTextStyle,),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            dropdownColor: Colors.white,
                            value: selectedValue,
                            items: typeOfJourney.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            hint:const Text(
                              "Select Journey",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String? value) {
                              if(value == "Onward") {
                                strJourneyId = "1";
                              }else if(value == "Backward"){
                                strJourneyId = "2";
                              }else{
                                strJourneyId = "3";
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _dateController,
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            readOnly: true,
                            style: AppTextStyles.createAcctStyle,
                            onTap: () {
                              _selectLeaveDate(context);
                            },
                            decoration: InputDecoration(
                              hintText: "From Date",
                              hintStyle: AppTextStyles.hintTextStyle,
                              errorBorder: InPutBorders.errorBorders,
                              focusedBorder: InPutBorders.focusBorders,
                              enabledBorder: InPutBorders.enableBorders,
                              suffixIcon: IconButton(
                                onPressed: (){_selectLeaveDate(context);},
                                icon: const Icon(Icons.calendar_month_outlined),
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _toDateController,
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            readOnly: true,
                            style: AppTextStyles.createAcctStyle,
                            onTap: () {
                              _selectToLeaveDate(context);
                            },
                            decoration: InputDecoration(
                              hintText: "To Date",
                              hintStyle: AppTextStyles.hintTextStyle,
                              errorBorder: InPutBorders.errorBorders,
                              focusedBorder: InPutBorders.focusBorders,
                              enabledBorder: InPutBorders.enableBorders,
                              suffixIcon: IconButton(
                                onPressed: (){_selectToLeaveDate(context);},
                                icon: const Icon(Icons.calendar_month_outlined),
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          _dateController.clear();
                          _toDateController.clear();
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Cancel',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2)),
                      ),
                      BlocConsumer<ScheduleLeaveBloc, CommonState>(
                          builder: (context, state) {
                            return TextButton(
                              onPressed: () async{
                                if(strJourneyId!.isEmpty) {
                                  Helper.getToastMsg("Please select journey");
                                }else if(_dateController.text.isEmpty) {
                                  Helper.getToastMsg("Please select from date");
                                }else if(_toDateController.text.isEmpty) {
                                  Helper.getToastMsg("Please select to date");
                                }else{
                                  String userId = await StorageUtil.instance.getStringValue(AppStrings.strPrefUserId);
                                  BlocProvider.of<ScheduleLeaveBloc>(context).add(
                                    ScheduleButton(userId, strJourneyId.toString(), _dateController.text.toString(), _toDateController.text.toString())
                                  );
                                }
                              },
                              child: const Text('Schedule',
                                  style: TextStyle(
                                      color: AppColors.blueColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.2)),
                            );
                          },
                          listener: (context, state) {
                            if(state is LoadingState) {
                              AppUtils.showProgressDialog(context, "Please wait...");
                            }else if(state is ApiSuccessState){
                              Helper.getToastMsg(state.mapData[AppStrings.keyMapMsg]);
                              Navigator.of(context).pop(true);
                              _dateController.clear();
                              _toDateController.clear();
                              Navigator.of(context, rootNavigator: true).pop();
                            }else if (state is ApiFailState) {
                              Navigator.of(context).pop(true);
                              Helper.getToastMsg(state.errorMessage);
                            }
                          }
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )) ??
          false;
    }

    Future<bool> _cancelLeaveDialog(BuildContext context) async {
      return (await showDialog(
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cancel Scheduled Leave',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2),
                      ),
                      Divider(
                        color: AppColors.blackColor,
                        thickness: 1,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            label: Text("Journey", style: AppTextStyles.studentNameTextStyle,),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          value: selectedValue,
                          items: typeOfJourney.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          hint:const Text(
                            "Select Journey",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String? value) {
                            if(value == "Onward") {
                              strJourneyId = "1";
                            }else if(value == "Backward"){
                              strJourneyId = "2";
                            }else{
                              strJourneyId = "3";
                            }
                            StorageUtil.instance.setStringValue(AppStrings.strPrefJourneyId, strJourneyId.toString());
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bgColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(routeCancelLeave);
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Calendar(strJourney: strJourneyId.toString(),)));
                      },
                      child: const Text('Cancel leave',
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2)),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text('Close',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )) ??
          false;
    }
}
