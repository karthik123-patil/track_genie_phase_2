import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/checkNetworkError.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

import '../../../../../domain/model/response/GetScheduleAndTripById.dart';

class TypeOFJourneyCubit extends Cubit<CommonState> {
  String? selectedValue;

  TypeOFJourneyCubit() : super(InitialState()) {}

  void onJourneySelect(String selectedItem) {
    if (selectedItem == AppStrings.journeyList[0]) {
      StorageUtil.instance.setStringValue(AppStrings.strPrefTypeOfJourney, "1");
    } else {
      StorageUtil.instance.setStringValue(AppStrings.strPrefTypeOfJourney, "2");
    }
    emit(OnSelectionState(selectedItem));
  }

  void startTheTrip() async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try {
          emit(LoadingState());
          String typeOfJourneyId = await StorageUtil.instance.getStringValue(AppStrings.strPrefTypeOfJourney);
          String userId = await StorageUtil.instance.getStringValue(AppStrings.strPrefUserId);

          GetScheduleAndTripById res = await ApiRepository.getInstance("")
              .getVehicleScheduleIDAndTripIDofStudentCorrespondingToGivenTypeOfJourney(
                  userId: userId, typeOfJourneyId: typeOfJourneyId);
          if(res.responseStatus == true){
            emit(LoadedState(res));
            StorageUtil.instance.setStringValue(AppStrings.strPrefTripScheduleId, res.data!.tripID.toString());
            StorageUtil.instance.setStringValue(AppStrings.strPrefVehicleScheduleId, res.data!.vehicleScheduleID.toString());
            StorageUtil.instance.setStringValue(AppStrings.strLineCalled, "LINE_NOT_CALLED");
          }else{
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
