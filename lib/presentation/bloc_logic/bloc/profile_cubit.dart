import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/ProfileModel.dart';
import '../state/CommonState.dart';

class ProfileCubit extends Cubit<CommonState> {
  ProfileCubit() : super(InitialState()) {
    getProfileData();
  }
  Future<void> getProfileData() async {
    emit(LoadingState());
    // String? name = await Auth.getUserName();
    // String? mobile = await Auth.getMobileNo();
    // String? email = await Auth.getEmail();
    // String? userId = await Auth.getLogin();
    //
    // String? mappingFor = await Auth.getMappingFor();
    // String? isEmailVerified = await Auth.getIsEmailVerified();

    // ProfileModel profileModel = ProfileModel(
    //     name!, mobile!, email!, userId!, mappingFor!, isEmailVerified!);

    emit(LoadedState("profileModel"));
  }
}
