import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/checkNetworkError.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/model/response/bus_info_model.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

class BusInfoCubit extends Cubit<CommonState> {
  BusInfoCubit() : super(InitialState()) {
    getBusInfo();
  }

  void getBusInfo() async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        emit(LoadingState());
        try {
          String userId = await StorageUtil.instance
              .getStringValue(AppStrings.strPrefUserId);
          String scheduleId = await StorageUtil.instance
              .getStringValue(AppStrings.strPrefVehicleScheduleId);
          BusInfoModel res = await ApiRepository.getInstance("").getBusInfo(
            userId: userId,
            scheduleId: scheduleId,
          );
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
}
