import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/model/studentInfo.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

class StudentInfoCubit extends Cubit<CommonState> {
  StudentInfoCubit() : super(InitialState()) {
    getStudentInfoData();
  }

  Future<void> getStudentInfoData() async {
    emit(LoadingState());
    String strName =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefFullName);
    String strContactNo =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefContactNo);
    String strUniqueId =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefUniqueId);
    String strAddress =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefAddress);
    String strPhoto =
        await StorageUtil.instance.getStringValue(AppStrings.strPrefPhoto);

    StudentInfo profileModel = StudentInfo(
        strName: strName,
        strContactNo: strContactNo,
        strUniqueId: strUniqueId,
        strAddress: strAddress,
        strPhoto: strPhoto);

    emit(LoadedState(profileModel));
  }
}
