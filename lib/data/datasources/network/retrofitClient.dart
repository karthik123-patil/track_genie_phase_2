import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../model/request/LoginRequest.dart';


part 'retrofitClient.g.dart';

@RestApi(baseUrl: "http://192.168.4.60:8200/trackgenie/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  ///post request
  @POST("validateUserForMobile")
  Future<dynamic> authenticateUser(@Body() LoginRequest request, @Query("iUser") String atmOfficerId,);
}
