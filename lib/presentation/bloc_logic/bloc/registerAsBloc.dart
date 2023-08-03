import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

class RegisterAsCubit extends Cubit<CommonState> {
  RegisterAsCubit() : super(InitialState()) ;

  void onCardSelection(String roleId){
    StorageUtil.instance.setStringValue(AppStrings.strPrefRoleId, roleId);
    switch(roleId){
      case "3":
        StorageUtil.instance.setStringValue(AppStrings.strPrefRegisterAs, AppStrings.isStudent);
      case "4":
        StorageUtil.instance.setStringValue(AppStrings.strPrefRegisterAs, AppStrings.isDriver);
      case "5":
        StorageUtil.instance.setStringValue(AppStrings.strPrefRegisterAs, AppStrings.isAttendant);
    }
    emit(OnSelectionState(roleId));
  }
}