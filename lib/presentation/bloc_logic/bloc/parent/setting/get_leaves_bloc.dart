import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

import '../../../../../config/checkNetworkError.dart';
import '../../../../../config/internet_conectivity.dart';
import '../../../../../config/strings.dart';
import '../../../../../domain/model/response/student/get_leaves_model.dart';
import '../../../../../domain/repositories/ApiRepository.dart';

class GetLeavesCubit extends Cubit<CommonState> {
  GetLeavesCubit() : super(InitialState()) {
    getScheduledLeaves();
  }

  getScheduledLeaves() async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try {
          emit(LoadingState());
          String journeyId = await StorageUtil.instance.getStringValue(AppStrings.strPrefJourneyId);
          String userId = await StorageUtil.instance.getStringValue(AppStrings.strPrefUserId);
          GetScheduledLeave res = await ApiRepository.getInstance("").getScheduledLeaveDates(userId: userId, journeyId: journeyId);
          if(res.responseStatus == true){
            emit(LoadedState(res));
          }else{
            emit(ApiFailState(res.responseMessage.toString()));
          }
        } on DioError catch (e) {
          String errorData =
          CheckNetworkError.getInstance().getNetworkError(e);
          emit(ApiFailState(errorData));
        }
      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }
}