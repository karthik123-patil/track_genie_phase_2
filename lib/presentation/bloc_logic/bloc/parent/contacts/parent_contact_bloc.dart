import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/checkNetworkError.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/model/response/school_contact.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

class ParentContactCubit extends Cubit<CommonState> {
  ParentContactCubit() : super(InitialState()) {
    getContactData();
  }
  Future<void> getContactData() async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try {
          emit(LoadingState());
          GetSchoolContacts res = await ApiRepository.getInstance("").getSchoolContact();
          if(res.responseStatus == true){
            emit(LoadedState(res));
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

    // emit(LoadedState(profileModel));
  }
}
