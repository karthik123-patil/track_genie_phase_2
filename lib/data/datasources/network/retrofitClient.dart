import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:track_genie_phase_2/domain/model/request/LoginRequest.dart';
import 'package:track_genie_phase_2/domain/model/response/GetScheduleAndTripById.dart';
import 'package:track_genie_phase_2/domain/model/response/auth/LoginResponse.dart';
import 'package:track_genie_phase_2/domain/model/response/bus_info_model.dart';
import 'package:track_genie_phase_2/domain/model/response/school_contact.dart';

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

  @POST("getVehicleSchedulesAssignedToDriverToday/{userId}")
  Future<dynamic> getSchedulesVehicleListDriver(
    @Path("userId") String roleId,
  );

  @POST("getVehicleSchedulesAssignedToAttendantToday/{userId}")
  Future<dynamic> getSchedulesVehicleListAttendant(
    @Path("userId") String roleId,
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

  @POST("getLastStopLatLongOfVehicleSchedule/{scheduleId}")
  Future<dynamic> getLastStopLatLongOfVehicleSchedule(
    @Path("scheduleId") String roleId,
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
}
