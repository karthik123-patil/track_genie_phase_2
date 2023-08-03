import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/domain/model/request/ScheduleLeaveRequest.dart';
import 'package:track_genie_phase_2/domain/model/response/PostModel.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/schedule_event.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

import '../../../../../config/checkNetworkError.dart';
import '../../../../../config/strings.dart';

class ScheduleLeaveBloc extends Bloc<ScheduleLeaveEvent, CommonState> {
  ScheduleLeaveBloc() : super(InitialState()){
    on<ScheduleButton>((event, emit)  async{
        Map mapData = {};
        String err = '' ;
        await InternetConnectivityCheck.getInstance().
        chkInternetConnectivity().then((value) async{
          if(value!) {
            try{
              emit(LoadingState());
              ScheduleLeaveRequest request = ScheduleLeaveRequest(
                userID: event.userID,
                typeOfJourney: event.typeOfJourney,
                startDate: event.startDate,
                endDate: event.endDate
              );

              PostModel res = await ApiRepository.getInstance("").scheduleLeave(request: request);
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