import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/model/response/student/notification_model.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import '../../../../../config/shared_preferences.dart';

class StudentNotificationCubit extends Cubit<CommonState> {
  StudentNotificationCubit() : super(InitialState()) {
    getNotificationsDet();
  }

  getNotificationsDet() async {
    await InternetConnectivityCheck.getInstance().chkInternetConnectivity()
        .then((value) async{
          if(value!) {
            emit(LoadingState());
            String userId = await StorageUtil.instance.getStringValue(AppStrings.strPrefUserId);
            NotificationResModel res = await ApiRepository.getInstance("").getLogOfPassengerStatus(userId: userId);
            if(res.responseStatus == true) {
              emit(LoadedState(res));
            }else{
              emit(ApiFailState("No notification found"));
            }
          }else{
            emit(ApiFailState(AppStrings.noInternetMsg));
          }
    });
  }
}