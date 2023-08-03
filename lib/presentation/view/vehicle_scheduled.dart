import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/model/response/driver/get_schedule_list.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/driver/vehicle_schedule_bloc.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';
import '../../config/Helper.dart';
import '../../config/shared_preferences.dart';
import '../bloc_logic/bloc/driver/schedule_event.dart';
import '../bloc_logic/state/CommonState.dart';

class VehicleScheduledScreen extends StatelessWidget {
  const VehicleScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    String strScheduleId = '';
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
                        BlocConsumer<VehicleScheduleBloc,CommonState>(
                            listener: (BuildContext context, Object? state) {
                            },
                            builder:  (context, state) {
                              if (state is LoadedState){
                                ScheduledVehicleList responseData = state.data as ScheduledVehicleList;
                                return Expanded(
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
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
                                    onChanged: (value) {
                                      strScheduleId = value.toString();
                                      StorageUtil.instance.setStringValue(AppStrings.strPrefVehicleScheduleId, value.toString());
                                    },
                                    value: selectedValue,
                                    items: responseData.data!.map((item) {
                                      return DropdownMenuItem(
                                        value: item.vehicleScheduleID
                                            .toString(),
                                        child: Text(
                                          item.routeVehicleScheduleName
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    hint:const Text(
                                      "Select Schedule",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    /* onChanged: (String? value) {
                              setState(() {
                                for (var element in scheduleList) {
                                  if (element['scheduleName']
                                      .toString() ==
                                      value) {
                                    strScheduleId = element['scheduleId']
                                        .toString();
                                  }
                                }
                                StorageUtil.instance.setStringValue(AppStrings.strPrefVehicleScheduleId, strScheduleId.toString());
                              });
                            },*/
                                  ),
                                );
                              }else{
                                return Container();
                              }

                            }
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocConsumer<VehicleScheduleBloc, CommonState>(
                    builder: (context, state) {
                      return Padding(
                        padding:
                        const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: state is LoadedState ? () async{
                                  String userId = await StorageUtil.instance.getStringValue(AppStrings.strPrefUserId);
                                  String strLat = await StorageUtil.instance.getStringValue(AppStrings.strCurrentLat);
                                  String strLong = await StorageUtil.instance.getStringValue(AppStrings.strCurrentLng);
                                  BlocProvider.of<VehicleScheduleBloc>(context).add(
                                      TripButtonEvent(
                                          userId,
                                          strLat,
                                          strLong, strScheduleId));
                                } : null,
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 13),
                                    backgroundColor: AppColors.bgColor,
                                    elevation: 2,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    )
                                ),
                                child: state is LoadingState ? const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: AppColors.blackColor,
                                    strokeWidth: 1,
                                  ),
                                ): Text(AppStrings.strStartTrip,
                                  style: AppTextStyles.btnTextStyle,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    listener: (context, state) {
                      if (state is ApiSuccessState) {
                        Navigator.of(context)
                            .pushNamed(routeDriverTrip);
                      } else if (state is TimeOutExceptionState) {
                        AppUtils().showLoginTimeOutDialog(context, () {
                          Navigator.of(context, rootNavigator: true).pop();
                        });
                      } else if (state is ApiFailState) {
                        Helper.getToastMsg(state.errorMessage);
                      }
                    },
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
