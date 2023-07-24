import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/checkNetworkError.dart';
import 'package:track_genie_phase_2/config/constant.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

class TypeOFJourneyCubit extends Cubit<CommonState> {
  String? selectedValue;
  TypeOFJourneyCubit() : super(InitialState()) {
    startTheTrip();
  }

  void onJourneySelect(String selectedItem) {
    emit(OnSelectionState(selectedItem));
  }

  void startTheTrip() async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try {
          emit(LoadingState());
          dynamic res = await ApiRepository.getInstance("")
              .getVehicleScheduleIDAndTripIDofStudentCorrespondingToGivenTypeOfJourney(userId: '', typeOfJourneyId: '');
          // emit(ApiSuccessState("mapData"));
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
