import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/checkNetworkError.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/model/request/LoginRequest.dart';
import 'package:track_genie_phase_2/domain/model/response/auth/LoginResponse.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';


import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, CommonState> {
  static bool isFocus = true;
  LoginBloc() : super(InitialState()) {
    on<TextChangeEvent>((event, emit) => {
          if (event.userID == "")
            {emit(ErrorState("Please enter username"))}
          else if (event.mobileNumber.isEmpty)
            {emit(ErrorState("Please enter password"))}
          else
            {emit(ValidState())}
        });

    on<SubmittedEvent>((event, emit) async {
      isFocus = false;
      Map mapData = Map();
      await InternetConnectivityCheck.getInstance()
          .chkInternetConnectivity()
          .then((value) async {
        if (value!) {
          try {
            emit(LoadingState());
            LoginRequest request = LoginRequest(
                token:
                    "cyz46zQpSO2h1j18X4pc3U:APA91bHFLOLGn40Jy4yL9o99X5FYX_Vt720-E2xJA5axDjeX7WDBJmVJNMNqRAgVDBL6BYmBBjTTuMe8xgq4uZnGZrojkti5IUtZN2Gh2cupDsZJ9yyk2Us9eUngJ7WeM5XGD9po1rZh");
            LoginResponse res = await ApiRepository.getInstance("")
                .authenticateUser(
                    request: request,
                    uniqueId: event.userID,
                    roleId: '3',
                    mobileNo: event.mobileNumber);


            if(res.responseStatus == true){
              StorageUtil.instance.setStringValue(AppStrings.strPrefUserId, res.data!.userID.toString());
              StorageUtil.instance.setStringValue(AppStrings.strPrefFullName, "${res.data!.userFirstName},${res.data!.userMiddleName},${res.data!.userLastName}");
              StorageUtil.instance.setStringValue(AppStrings.strPrefUniqueId, res.data!.userUniqueKey.toString());
              StorageUtil.instance.setStringValue(AppStrings.strPrefContactNo, res.data!.userPhoneNumber.toString());
              StorageUtil.instance.setStringValue(AppStrings.strPrefAddress, res.data!.userAddress.toString());
              StorageUtil.instance.setStringValue(AppStrings.strPrefPhoto, res.data!.userPhoto.toString());
              String strRegisterAs = await StorageUtil.instance.getStringValue(AppStrings.strPrefRegisterAs);
              mapData[AppStrings.keyMapRegister] = strRegisterAs;
              mapData[AppStrings.keyMapMsg] = res.responseMessage;
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
}
