import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:track_genie_phase_2/domain/model/request/LoginRequest.dart';
import 'package:track_genie_phase_2/domain/model/request/ScheduleLeaveRequest.dart';
import 'package:track_genie_phase_2/domain/model/response/GetScheduleAndTripById.dart';
import 'package:track_genie_phase_2/domain/model/response/LastStopLatLongOfVehicleScheduleModel.dart';
import 'package:track_genie_phase_2/domain/model/response/StudentDataModel.dart';
import 'package:track_genie_phase_2/domain/model/response/auth/LoginResponse.dart';
import 'package:track_genie_phase_2/domain/model/response/bus_info_model.dart';
import 'package:track_genie_phase_2/domain/model/response/school_contact.dart';
<<<<<<< Updated upstream

import '../../../domain/model/response/LatLongOrderOfAllStopsOfVehicleScheduleModel.dart';
=======
import 'package:track_genie_phase_2/domain/model/response/student/get_leaves_model.dart';
import 'package:track_genie_phase_2/domain/model/response/student/notification_model.dart';
import '../../../domain/model/request/UpdateLatLongRequest.dart';
import '../../../domain/model/response/PostModel.dart';
>>>>>>> Stashed changes
import '../../../domain/model/response/TripStatusModel.dart';
import '../../../domain/model/response/driver/get_schedule_list.dart';
import '../../../domain/model/response/driver/get_stops_with_time.dart';
import '../../../domain/model/response/driver/start_schedule_model.dart';
part 'retrofitClient.g.dart';

@RestApi(baseUrl: "http://192.168.4.60:8200/trackgenie/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("validateUserForMobile/{roleId}/{uniqueId}/{mobileNo}")
  Future<LoginResponse> authenticateUser(
      @Body() LoginRequest request,
      @Path("roleId") String roleId,
      @Path("uniqueId") String uniqueId,
      @Path("mobileNo") String mobileNo);

  @GET("getVehicleSchedulesAssignedToDriverToday/{userId}")
  Future<ScheduledVehicleList> getSchedulesVehicleListDriver(
    @Path("userId") String userId,
  );

  @GET("getVehicleSchedulesAssignedToAttendantToday/{userId}")
  Future<ScheduledVehicleList> getSchedulesVehicleListAttendant(
    @Path("userId") String userId,
  );

  @GET("startVehicleScheduleByDriver/{userId}/{strScheduleId}")
  Future<StartVehicleSchedule> startVehicleScheduleByDriver(
      @Path("userId") String userId,
      @Path("strScheduleId") String strScheduleId,
      );

  @GET("startVehicleScheduleByAttendant/{userId}/{strScheduleId}")
  Future<StartVehicleSchedule> startVehicleScheduleByAttendant(
      @Path("userId") String userId,
      @Path("strScheduleId") String strScheduleId,
      );

  @GET("get_Stop_StudentsCount_ScheduledTime_List/{tripId}")
  Future<StopsWithTimeList> getStopsWithTime(
      @Path("tripId") String tripId,
      );

  @GET("get_Stop_StudentsCount_ScheduledTime_List/{orginLat}")
  Future<StopsWithTimeList> getStopDistances(
      @Path("tripId") String tripId,
      );

  @GET(
      "getVehicleScheduleIDAndTripIDofStudentCorrespondingToGivenTypeOfJourney/{userId}/{typeOfJourneyId}")
  Future<GetScheduleAndTripById>
      getVehicleScheduleIDAndTripIDofStudentCorrespondingToGivenTypeOfJourney(
          @Path("userId") String userId,
          @Path("typeOfJourneyId") String typeOfJourneyId);



  @GET("getSchoolContact")
  Future<GetSchoolContacts> getSchoolContact();

  @POST("scheduleLeave")
  Future<dynamic> sendScheduleLeave(
    @Path("userId") String roleId,
  );

  @PUT("{operation}/{userId}/{val}")
  Future<dynamic> postNotificationSetting(
    @Path("operation") String operation,
    @Path("userId") String userId,
    @Path("val") String val,
  );

  @GET("getBusInfo/{userId}/{scheduleId}")

  Future<BusInfoModel> getBusInfo(
    @Path("userId") String userId,
    @Path("scheduleId") String scheduleId,
  );

  ///this all api use for drive trip module
  // at the time of ui load  -
  // driverHomescreen
  // getLastStopLatLongOfVehicleSchedule
  // getLatLongOrderOfAllStopsOfVehicleSchedule

  @GET("driverHomescreen/{tripScheduleId}")
  Future<TripStatusModel> getdriverHomescreen(
      @Path("tripScheduleId") String tripScheduleId);

  @GET("getLastStopLatLongOfVehicleSchedule/{scheduleId}")
  Future<LastStopLatLongOfVehicleScheduleModel>
      getLastStopLatLongOfVehicleSchedule(
          @Path("scheduleId") String scheduleId);

  @GET("getLatLongOrderOfAllStopsOfVehicleSchedule/{scheduleId}")
  Future<LatLongOrderOfAllStopsOfVehicleScheduleModel>
      getLatLongOrderOfAllStopsOfVehicleSchedule(
          @Path("scheduleId") String scheduleId);

  @GET("getStudentsStatusOfGivenStopOfGivenTrip/{tripScheduleId}/{stopId}")
  Future<StudentDataModel>
      getStudentsStatusOfGivenStopOfGivenTrip(
    @Path("tripScheduleId") String tripScheduleId,
    @Path("stopId") String stopId,
  );

  @GET("busReachedDestination/{tripId}")
  Future<dynamic> busReachedDestination(@Path("tripId") String tripId);

  @GET("getStudentDetailsHavingUniqueKey/{uniqueId}/{strOptions}/{strTripId}")
  Future<dynamic> verifyStudentByUnique(
      @Path("uniqueId") String scheduleId,
      @Path("strOptions") String strOptions,
      @Path("strTripId") String strTripId);

  @GET("getStudentDetailsHavingQRcodeString/{qrCode}/{strOptions}/{strTripId}")
  Future<dynamic> verifyStudentByQRCOde(
      @Path("qrCode") String scheduleId,
      @Path("strOptions") String strOptions,
<<<<<<< Updated upstream
      @Path("strTripId") String strTripId);
=======
      @Path("strTripId") String strTripId
      );


  @PUT("updateCurrentLatLongAndTimeRequiredToReachAtOtherStops")
  Future<PostModel> updateLatLongWithTime(
      @Body() UpdateLatLongRequest request);

  @POST("scheduleLeave")
  Future<PostModel> scheduleLeave(
      @Body() ScheduleLeaveRequest request);

  @GET("getSheduledLeaveDates/{userId}/{journeyId}")
  Future<GetScheduledLeave> getScheduledLeaveDates(
      @Path("userId") String userId,
      @Path("journeyId") String journeyId
      );

  @DELETE("cancelScheduledLeave/{userId}/{strJourney}/{date}")
  Future<PostModel> cancelScheduledLeave(
      @Path("userId") String userId,
      @Path("strJourney") String strJourney,
      @Path("date") String date,
      );

  @GET("getLogOfPassengerStatus/{userId}")
  Future<NotificationResModel> getLogOfPassengerStatus(
      @Path("userId") String userId
      );
>>>>>>> Stashed changes
}
