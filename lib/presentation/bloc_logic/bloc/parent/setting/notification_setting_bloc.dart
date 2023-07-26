import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/checkNetworkError.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

import '../../../../../domain/model/notification_setting.dart';

class NotificationSettingCubit extends Cubit<CommonState> {
  NotificationSettingCubit() : super(InitialState()) {

  }



  Future<void> switchModeSetting(NotificationSettingModel model) async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try{
          String userId =
          await StorageUtil.instance.getStringValue(AppStrings.strPrefUserId);
          dynamic res = await ApiRepository.getInstance("")
              .postNotificationSetting(
              operation: model.key,
              userId: userId,
              val: model.value.toString());
        }on DioError catch (e) {
          String errorData =
          CheckNetworkError.getInstance().getNetworkError(e);
          emit(ApiFailState(errorData));
        }

      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }

  void getNotificationSettingList() async {
    emit(LoadingState());
    List<NotificationSettingModel> listData = [
      NotificationSettingModel(
          title: AppStrings.strBusArrived,
          key: 'enable_WhenBusArrivedAtSchool',
          value: false),
      NotificationSettingModel(
          title: AppStrings.strBusLeft,
          key: 'enable_WhenBusLeftSchool',
          value: false),
      NotificationSettingModel(
          title: AppStrings.strBusArrivedAtHome,
          key: 'enable_WhenBusArrivedAtYourHome',
          value: false),
      NotificationSettingModel(
          title: AppStrings.strWhenBusLeftHome,
          key: 'enable_WhenBusLeftYourHome',
          value: false),
      NotificationSettingModel(
          title: AppStrings.strBusNearbyHome,
          key: 'enable_WhenBusIsNearByMyHome',
          value: false)
    ];
    emit(LoadedState(listData));
  }
}
