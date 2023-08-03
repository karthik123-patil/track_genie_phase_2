import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:track_genie_phase_2/config/strings.dart';

class LocationService {
  late LocationPermission permission;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error(AppStrings.textLocationService);
    }

    else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(AppStrings.textLocationPerm);
      }
    }
    else if (permission == LocationPermission.deniedForever) {
      return Future.error(
          AppStrings.textLocationDenied);
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<Placemark> getAddressFromLatLong(Position position)async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (kDebugMode) {
      print(placeMarks);
    }
    Placemark place = placeMarks[0];
    return place;
  }

  Future<Position> getUserPosition()async {
    Position position = await _getGeoLocationPosition();
    return position;
  }
}
