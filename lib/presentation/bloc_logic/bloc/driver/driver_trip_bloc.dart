import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/domain/model/response/TripStatusModel.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

class DriverTripCubit extends Cubit<CommonState> {
  DriverTripCubit() : super(InitialState()) {
    getTripDetails();
  }

  Future<void> getTripDetails() async {
    print("object");
    emit(LoadingState());
    TripStatusModel tripStatusModel = await ApiRepository.getInstance("")
        .getTripDetails(tripScheduleId: '193');

    print(jsonEncode(tripStatusModel));

    emit(LoadedState("profileModel"));
  }
}
