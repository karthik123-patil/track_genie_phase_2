import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/service/location_service.dart';

enum SplashScreenState { Initial, Loding, FirstSlide, RegisterAsScreen }

class SplashScreenCubit extends Cubit<SplashScreenState> {
  Position? currentLocation;

  SplashScreenCubit() : super(SplashScreenState.Initial) {
    emit(SplashScreenState.Loding);

    Future.delayed(const Duration(milliseconds: 3000), () async {
      setInitialLocation();

      StorageUtil.instance
          .getStringValue(AppStrings.strPrefScreenSeen)
          .then((screenSeen) {
        if (screenSeen == AppStrings.strPrefScreenSeen) {
          emit(SplashScreenState.RegisterAsScreen);
        } else {
          emit(SplashScreenState.FirstSlide);
        }
      });
    });
  }

  void setInitialLocation() async {
    currentLocation = await LocationService().getUserPosition();
    StorageUtil.instance.setStringValue(
        AppStrings.strCurrentLat, currentLocation!.latitude.toString());
    StorageUtil.instance.setStringValue(
        AppStrings.strCurrentLng, currentLocation!.longitude.toString());

    String strLat =
        await StorageUtil.instance.getStringValue(AppStrings.strCurrentLat);
    String strLong =
        await StorageUtil.instance.getStringValue(AppStrings.strCurrentLng);

    // if (kDebugMode) {
    //   print("CURRENT_LAT_LONG\t\t$strLat\t\t$strLong");
    // }
  }
}
