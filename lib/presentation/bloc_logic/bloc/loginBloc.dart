import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

import '../../../config/Helper.dart';
import '../../../config/constant.dart';
import '../../../config/internet_conectivity.dart';
import '../../../config/packageInfo.dart';

import '../event/login_event.dart';

class LoginBloc extends Bloc<LoginEvent, CommonState> {
  LoginBloc() : super(InitialState()) {
    on<TextChangeEvent>((event, emit) => {
          if (event.username == "")
            {emit(ErrorState("Please enter username"))}
          else if (event.password.isEmpty)
            {emit(ErrorState("Please enter password"))}
          else
            {emit(ValidState())}
        });

    on<SubmittedEvent>((event, emit) async {
      await InternetConnectivityCheck.getInstance()
          .chkInternetConnectivity()
          .then((value) async {
        if (value!) {
          emit(LoadingState());

          // String deviceId = await Helper.getDeviceId();
          String deviceId = "qwert";
          PackageInfo packageInfo = await PackageInformation().getPackageData();
          String appVersion = packageInfo.version;
          Helper.getErrorLog(appVersion);
        } else {
          emit(ApiFailState(Constant.noInternetMsg));
        }
      });
    });
  }
}
