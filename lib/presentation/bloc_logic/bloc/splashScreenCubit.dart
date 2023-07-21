import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
enum SplashScreenState { Initial, Loding, FirstSlide,RegisterAsScreen }

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState.Initial) {
    emit(SplashScreenState.Loding);

    Future.delayed(const Duration(milliseconds: 3000), () async {

      StorageUtil.instance.getStringValue(AppStrings.strPrefScreenSeen).then((screenSeen) {
        if(screenSeen == AppStrings.strPrefScreenSeen){
          emit(SplashScreenState.RegisterAsScreen);
        }else{
          emit(SplashScreenState.FirstSlide);
        }
      });
    });
  }
}
