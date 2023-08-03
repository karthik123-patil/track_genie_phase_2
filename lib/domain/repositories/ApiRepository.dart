import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:track_genie_phase_2/domain/model/request/LoginRequest.dart';
import 'package:track_genie_phase_2/domain/model/response/GetScheduleAndTripById.dart';
import 'package:track_genie_phase_2/domain/model/response/StudentDataModel.dart';
import 'package:track_genie_phase_2/domain/model/response/TripStatusModel.dart';
import 'package:track_genie_phase_2/domain/model/response/auth/LoginResponse.dart';
import 'package:track_genie_phase_2/domain/model/response/bus_info_model.dart';
import 'package:track_genie_phase_2/domain/model/response/school_contact.dart';

import '../../data/datasources/network/RequestResponseInspector.dart';
import '../../data/datasources/network/retrofitClient.dart';
import '../model/response/LastStopLatLongOfVehicleScheduleModel.dart';
import '../model/response/LatLongOrderOfAllStopsOfVehicleScheduleModel.dart';

class ApiRepository {
  static final _sharedInstance = ApiRepository._internal();

  ApiRepository._internal();


  static Dio dio = Dio(BaseOptions(connectTimeout: 30 * 1000));

  static late RestClient client;

  static ApiRepository getInstance(String token) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };


    dio.options.headers["Content-Type"] = "application/json";
    // dio.options.headers["authToken"] = token;
    dio.interceptors.add(RequestResponseInspector());
    client = RestClient(dio);
    return _sharedInstance;
  }

  Future<LoginResponse> authenticateUser(
      {required LoginRequest request,
      required String roleId,
      required String uniqueId,
      required String mobileNo}) async {
    return await ApiRepository.client
        .authenticateUser(request, roleId, uniqueId, mobileNo);
  }

  Future<dynamic> getSchedulesVehicleListDriver(
      {required String roleId}) async {
    return await ApiRepository.client.getSchedulesVehicleListDriver(roleId);
  }

  Future<dynamic> getSchedulesVehicleListAttendant(
      {required String roleId}) async {
    return await ApiRepository.client.getSchedulesVehicleListAttendant(roleId);
  }

  Future<GetScheduleAndTripById>
      getVehicleScheduleIDAndTripIDofStudentCorrespondingToGivenTypeOfJourney(
          {required String userId, required String typeOfJourneyId}) async {
    return await ApiRepository.client
        .getVehicleScheduleIDAndTripIDofStudentCorrespondingToGivenTypeOfJourney(
            userId, typeOfJourneyId);
  }

  Future<GetSchoolContacts> getSchoolContact() async {
    return await ApiRepository.client.getSchoolContact();
  }

  Future<GetSchoolContacts> postNotificationSetting(
      {required String operation,
      required String userId,
      required String val}) async {
    return await ApiRepository.client
        .postNotificationSetting(operation, userId, val);
  }

  Future<BusInfoModel> getBusInfo(
      {required String userId, required String scheduleId}) async {
    return await ApiRepository.client.getBusInfo(userId, scheduleId);
  }

  Future<TripStatusModel> getdriverHomescreen(
      {required String tripScheduleId}) async {
    return await ApiRepository.client.getdriverHomescreen(tripScheduleId);
  }

  Future<LastStopLatLongOfVehicleScheduleModel>
      getLastStopLatLongOfVehicleSchedule({required String scheduleId}) async {
    return await ApiRepository.client
        .getLastStopLatLongOfVehicleSchedule(scheduleId);
  }

  Future<LatLongOrderOfAllStopsOfVehicleScheduleModel>
      getLatLongOrderOfAllStopsOfVehicleSchedule(
          {required String scheduleId}) async {
    return await ApiRepository.client
        .getLatLongOrderOfAllStopsOfVehicleSchedule(scheduleId);
  }

  Future<StudentDataModel>
      getStudentsStatusOfGivenStopOfGivenTrip({
    required String tripScheduleId,
    required String stopId,
  }) async {
    return await ApiRepository.client.getStudentsStatusOfGivenStopOfGivenTrip(tripScheduleId,stopId);
  }
}
