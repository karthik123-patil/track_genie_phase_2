import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/cancel_event.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

import '../../../../../config/checkNetworkError.dart';
import '../../../../../config/internet_conectivity.dart';
import '../../../../../config/shared_preferences.dart';
import '../../../../../config/strings.dart';
import '../../../../../domain/model/response/PostModel.dart';
import '../../../../../domain/repositories/ApiRepository.dart';

class CancelLeaveBloc extends Bloc<CancelLeaveEvent, CommonState> {
  CancelLeaveBloc(): super(InitialState()) {
    on<CancelButton>((event, emit) async{
      Map mapData = {};
      String err = '' ;
      await InternetConnectivityCheck.getInstance().
      chkInternetConnectivity().then((value) async{
        if(value!) {
          try{
            emit(LoadingState());
            String userId = await StorageUtil.instance.getStringValue(AppStrings.strPrefUserId);
            PostModel res = await ApiRepository.getInstance("").cancelScheduledLeave(userId: userId, strJourney: event.journeyId, date: event.date);
            err = res.responseMessage.toString();
            if(res.responseStatus == true) {
              mapData[AppStrings.keySuccessMsg] = "Success";
              mapData[AppStrings.keyMapMsg] = res.responseMessage;
            }else{
              mapData[AppStrings.keySuccessMsg] = "Failed";
              mapData[AppStrings.keyMapMsg] = res.responseMessage;
            }
            emit(ApiSuccessState(mapData));
          }on DioError catch (e) {
            String errorData =
            CheckNetworkError.getInstance().getNetworkError(e);
            if(errorData == "404"){
              emit(ApiFailState(err));
            } else if(errorData == AppStrings.timeOutMsg){
              emit(TimeOutExceptionState());
            }else{
              emit(ApiFailState(errorData));
            }

          }
        }else {
          emit(ApiFailState(AppStrings.noInternetMsg));
        }
      });
    });
  }
}