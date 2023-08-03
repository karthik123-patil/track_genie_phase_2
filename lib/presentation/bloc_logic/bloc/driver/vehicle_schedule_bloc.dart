import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/domain/model/response/PostModel.dart';
import 'package:track_genie_phase_2/domain/model/response/driver/get_schedule_list.dart';
import 'package:track_genie_phase_2/domain/model/response/driver/get_stops_with_time.dart';
import 'package:track_genie_phase_2/domain/model/response/driver/start_schedule_model.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/driver/schedule_event.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import '../../../../config/checkNetworkError.dart';
import '../../../../config/internet_conectivity.dart';
import '../../../../config/shared_preferences.dart';
import '../../../../config/strings.dart';
import '../../../../domain/model/request/UpdateLatLongRequest.dart';
import '../../../../domain/repositories/ApiRepository.dart';


class VehicleScheduleBloc extends Bloc<StartTripEvent, CommonState> {
  static bool isFocus = true;
  VehicleScheduleBloc() : super(InitialState()) {
    getVehicleSchedule();
    on<TripButtonEvent>((event, emit) async {
      isFocus = false;
      Map mapData = Map();
      await InternetConnectivityCheck.getInstance()
          .chkInternetConnectivity()
          .then((value) async {
        if (value!) {
          try {
            emit(LoadingState());
            StartVehicleSchedule res = StartVehicleSchedule();
            String registerAs = await StorageUtil.instance.getStringValue(AppStrings.strPrefRegisterAs);
            if(registerAs == "Driver"){
              res = await ApiRepository.getInstance("")
                  .startVehicleScheduleByDriver(
                userId: event.userID,
                strScheduleId:  event.scheduleId,);
            }else{
              res = await ApiRepository.getInstance("")
                  .startVehicleScheduleByAttendant(
                userId: event.userID,
                strScheduleId:  event.scheduleId,);
            }

            if(res.responseStatus == true){
              StorageUtil.instance.setStringValue(AppStrings.strPrefTripScheduleId, res.data.toString());
              StorageUtil.instance.setStringValue(AppStrings.strPrefJourney, res.typeOfJourney.toString());
              StorageUtil.instance.setStringValue(AppStrings.strBusStatus, "BUS_NOT_REACHED");
              String registerAs = await StorageUtil.instance.getStringValue(AppStrings.strPrefRegisterAs);
              mapData[AppStrings.keyMapMsg] = res.responseMessage;
              if(registerAs == "Driver") {
                getDistance(startLatitude: double.parse(event.lat), startLongitude: double.parse(event.long), tripId: res.data.toString());
              }
            }
            emit(ApiSuccessState(mapData));
          } on DioError catch (e) {
            String errorData =
            CheckNetworkError.getInstance().getNetworkError(e);
            if(errorData == "404"){
              emit(ApiFailState("Invalid User"));
            } else if(errorData == AppStrings.timeOutMsg){
              emit(TimeOutExceptionState());
            }else{
              emit(ApiFailState(errorData));
            }
          }
        } else {
          emit(ApiFailState(AppStrings.noInternetMsg));
        }
      });
    });
  }

  void getVehicleSchedule() async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        emit(LoadingState());
        try {
          String userId = await StorageUtil.instance
              .getStringValue(AppStrings.strPrefUserId);
          String registerAs = await StorageUtil.instance.getStringValue(AppStrings.strPrefRegisterAs);
          ScheduledVehicleList res = ScheduledVehicleList();
          if(registerAs == "Driver") {
             res = await ApiRepository.getInstance("")
                .getSchedulesVehicleListDriver(userId: userId);
          }else{
             res = await ApiRepository.getInstance("")
                .getSchedulesVehicleListAttendant(userId: userId);
          }

          if (res.responseStatus == true) {
            emit(LoadedState(res));
          } else {
            emit(ApiFailState(res.responseMessage!));
          }
        } on DioError catch (e) {
          String errorData = CheckNetworkError.getInstance().getNetworkError(e);
          emit(ApiFailState(errorData));
        }
      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }

  void getDistance({required double startLatitude, required double startLongitude, required String tripId}) async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try {
          StopsWithTimeList res = await ApiRepository.getInstance("")
              .getStopsWithTime(tripId: tripId);
          if (res.responseStatus == true) {
            for (int i = 0; i < res.data!.length; i++) {
              if (res.data![i].stop!.stopLatitude!.isNotEmpty &&
                  res.data![i].stop!.stopLongitude!.isNotEmpty){
                String url =
                    'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${res.data![i].stop!.stopLatitude.toString()},${res.data![i].stop!.stopLongitude.toString()}&origins=$startLatitude,$startLongitude&key=${AppStrings.strGoogleKey}';
                Dio dio = Dio();
                var header = {'Content-type': 'application/json'};
                var apiResponse = await dio.get(url,
                  options: Options(
                      headers: header
                  ),);
                if(apiResponse.statusCode == 200){
                  if(apiResponse.data['status'] == "OK") {
                    if (kDebugMode) {
                      print("Google Res ${apiResponse.data['status'].toString()}" );
                    }
                    for (int j = 0; j < apiResponse.data['rows']!.length; j++){
                      if(apiResponse.data['rows'][j]['elements'][j]['duration'] != null){
                        UpdateLatLongRequest request = UpdateLatLongRequest(
                            tripID: int.parse(tripId),
                            stopID: int.parse(res.data![i].stop!.stopID.toString()),
                            time: apiResponse.data['rows'][j]['elements'][j]['duration']['text'].toString(),
                            busCurrentLat: startLatitude.toString(),
                            busCurrentLong: startLongitude.toString()
                        );

                        PostModel latLongRes =  await ApiRepository.getInstance("").updateLatLongWithTime(request: request);
                        if(latLongRes.responseStatus == true) {
                          if (kDebugMode) {
                            print("Bus LatLong Updated");
                          }
                        }else{
                          if (kDebugMode) {
                            print("Bus LatLong Updated");
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        } on DioError catch (e) {
          if (kDebugMode) {
            print(e.toString());
          }
        }
      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }
}