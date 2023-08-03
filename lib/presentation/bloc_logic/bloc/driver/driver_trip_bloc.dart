import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/internet_conectivity.dart';
import 'package:track_genie_phase_2/domain/model/response/StudentDataModel.dart';
import 'package:track_genie_phase_2/domain/model/response/TripStatusModel.dart';
import 'package:track_genie_phase_2/domain/repositories/ApiRepository.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';

import '../../../../config/checkNetworkError.dart';
import '../../../../config/strings.dart';
import '../../../../domain/model/response/LastStopLatLongOfVehicleScheduleModel.dart';
import '../../../../domain/model/response/LatLongOrderOfAllStopsOfVehicleScheduleModel.dart';
import '../../../../domain/model/task/task_model.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:ui' as ui;

class DriverTripCubit extends Cubit<CommonState> {
  DriverTripCubit() : super(InitialState()) {
    getTripDetails();
  }

  Map mapData = Map();
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> markers = {};
  LatLng sourceLoc = const LatLng(0.0, 0.0);
  List<TaskModel> listOfTasks = [];
  List<LatLng> polyLineCoordinates = [];
  final Set<Polyline> _polyLines = {};

  Future<void> getTripDetails() async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try {
          emit(LoadingState());

          LastStopLatLongOfVehicleScheduleModel lastLocation =
              await ApiRepository.getInstance("")
                  .getLastStopLatLongOfVehicleSchedule(scheduleId: '46');

          Position? currentLocation = await Geolocator.getLastKnownPosition();

          ///initialCameraPosition
          BitmapDescriptor.fromAssetImage(
              ImageConfiguration.empty, 'assets/images/bus_marker.png')
              .then((onValue) {
            currentLocationIcon = onValue;
            print(currentLocationIcon);
          });
          CameraPosition initialCameraPosition = CameraPosition(
              zoom: AppStrings().cameraZoom,
              bearing: AppStrings().cameraBearing,
              tilt: AppStrings().cameraTilt,
              target: AppUtils.sourceLocation);
          if (currentLocation != null) {
            initialCameraPosition = CameraPosition(
              zoom: AppStrings().cameraZoom,
              bearing: AppStrings().cameraBearing,
              tilt: AppStrings().cameraTilt,
              target: LatLng(currentLocation!.latitude, currentLocation!.longitude),
            );
            markers.add(
              Marker(
                icon: currentLocationIcon,
                markerId: const MarkerId("currentLocation"),
                position:
                LatLng(currentLocation!.latitude, currentLocation!.longitude),
              ),
            );
          }

          LatLongOrderOfAllStopsOfVehicleScheduleModel reponse =
          await ApiRepository.getInstance("")
              .getLatLongOrderOfAllStopsOfVehicleSchedule(scheduleId: '46');

          if (reponse.responseStatus == true) {
            /* TaskModel model = TaskModel(
                "0", "Polyline 0", "", currentLocation!.latitude, currentLocation!.longitude, double.parse(value1.data![0].stop!.stopLatitude.toString()), double.parse(value1.data![0].stop!.stopLongitude.toString()));*/
            TaskModel model = TaskModel(
                "0",
                "Polyline 0",
                "",
                sourceLoc.latitude,
                sourceLoc.longitude,
                double.parse(reponse.data![0].stop!.stopLatitude.toString()),
                double.parse(reponse.data![0].stop!.stopLongitude.toString()));
            listOfTasks.add(model);
            for (int i = 0; i < reponse.data!.length; i++) {
              if (i != reponse.data!.length - 1) {
                TaskModel m1 = TaskModel(
                    (i + 1).toString(),
                    "Polyline ${i + 1}",
                    "",
                    double.parse(
                        reponse.data![i].stop!.stopLatitude.toString()),
                    double.parse(
                        reponse.data![i].stop!.stopLongitude.toString()),
                    double.parse(
                        reponse.data![i + 1].stop!.stopLatitude.toString()),
                    double.parse(
                        reponse.data![i + 1].stop!.stopLongitude.toString()));
                listOfTasks.add(m1);
              }
            }
            Polyline polyline;
            if (listOfTasks.isNotEmpty) {
              for (int i = 0; i < listOfTasks.length; i++) {
                Uint8List markerIcon = await getBytesFromCanvas(i + 1, 60, 60);
                LatLng dest =
                LatLng(listOfTasks[i].dlatitude, listOfTasks[i].dlongitude);
                markers.add(Marker(
                    markerId: MarkerId(i.toString()),
                    position: dest,
                    icon: BitmapDescriptor.fromBytes(markerIcon)));
                PolylinePoints polylinePoints = PolylinePoints();
                PolylineResult result =
                await polylinePoints.getRouteBetweenCoordinates(
                    AppStrings.strGoogleKey,
                    PointLatLng(listOfTasks[i].slatitude,
                        listOfTasks[i].slongitude),
                    PointLatLng(listOfTasks[i].dlatitude,
                        listOfTasks[i].dlongitude),
                    travelMode: TravelMode.driving);

                print("error_message : ${result.errorMessage}");
                print("status        : ${result.status}");

                if (result.points.isNotEmpty) {
                  result.points.forEach((PointLatLng point) {
                    polyLineCoordinates
                        .add(LatLng(point.latitude, point.longitude));
                  });
                }
                polyline = Polyline(
                    polylineId: PolylineId("poly${listOfTasks[i].taskid}"),
                    color: const Color.fromARGB(204, 147, 70, 140),
                    width: 4,
                    points: polyLineCoordinates);
                _polyLines.add(polyline);
              }
            }
          }
          mapData["lastLocation"] = lastLocation;
          mapData["position"] = currentLocation;
          mapData["initialCameraPosition"] = initialCameraPosition;
          mapData["markers"] = markers;
          mapData["polyLines"] = _polyLines;

          emit(LoadedState(mapData));
        } on DioError catch (e) {
          String errorData = CheckNetworkError.getInstance().getNetworkError(e);
          if (errorData == "404") {
            emit(ApiFailState("Invalid User"));
          } else if (errorData == AppStrings.timeOutMsg) {
            emit(TimeOutExceptionState());
          } else {
            emit(ApiFailState(errorData));
          }
        }
      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }

  Future<Uint8List> getBytesFromCanvas(
      int customNum, int width, int height) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppColors.qatarColor;
    final Radius radius = Radius.circular(width / 2);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: customNum.toString(), // your custom number here
      style: const TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
    );

    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * .5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }
}

class DriverTripUpdateCubit extends Cubit<CommonState> {
  DriverTripUpdateCubit() : super(InitialState()) {
    getPointsAPi();
    onNotificationCallAPi();
  }

  Map mapData = Map();

  Future<void> onNotificationCallAPi() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
      if (message!.from!.startsWith('/topics/')) {
        String topic = message.from!.substring('/topics/'.length);
        print('Received a message from topic: $topic');
        getPointsAPi();
      } else {
        print('Received a direct message');
      }
    });
  }

  Future<void> getPointsAPi() async {

    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        try {
          emit(LoadingState());
          // TripStatusModel reponse = await ApiRepository.getInstance("")
          //     .getdriverHomescreen(tripScheduleId: '193');
          String objText =
              '{ "responseStatus": true, "responseMessage": "Data found.", "data": { "missedBusCount": 0, "totalCountExcludingStudentsOnScheduledLeave": 4, "passengerStatusMessage": "In Bus", "totalStops": 5, "list": [ { "stopOrder": 1, "stop": { "stopID": 37, "stopName": "Elita Promenade", "stopLatitude": "12.89220577", "stopLongitude": "77.5794112" }, "scheduledArrivalTime": "07:30:00", "scheduledDepartureTime": "07:30:00", "missedBusStudentsCount": 0, "pickedStudentsCount": 0, "totalStudentsCountExcludingStudentsOnScheduledLeave": 1 }, { "stopOrder": 2, "stop": { "stopID": 38, "stopName": "Samsung SmartCafé", "stopLatitude": "12.89947565", "stopLongitude": "77.58112781" }, "scheduledArrivalTime": "07:40:00", "scheduledDepartureTime": "07:50:00", "missedBusStudentsCount": 0, "pickedStudentsCount": 0, "totalStudentsCountExcludingStudentsOnScheduledLeave": 1 }, { "stopOrder": 3, "stop": { "stopID": 39, "stopName": "Livspace", "stopLatitude": "12.9095152", "stopLongitude": "77.59125583" }, "scheduledArrivalTime": "08:00:00", "scheduledDepartureTime": "08:10:00", "missedBusStudentsCount": 0, "pickedStudentsCount": 0, "totalStudentsCountExcludingStudentsOnScheduledLeave": 1 }, { "stopOrder": 4, "stop": { "stopID": 40, "stopName": "Vega City", "stopLatitude": "12.90842927", "stopLongitude": "77.6011788" }, "scheduledArrivalTime": "08:20:00", "scheduledDepartureTime": "08:30:00", "missedBusStudentsCount": 0, "pickedStudentsCount": 0, "totalStudentsCountExcludingStudentsOnScheduledLeave": 1 }, { "stopOrder": 5, "stop": { "stopID": 41, "stopName": "MasterCom Technology Services India Pvt Ltd", "stopLatitude": "12.92815117", "stopLongitude": "77.601299" }, "scheduledArrivalTime": "08:30:00", "scheduledDepartureTime": "08:30:00", "missedBusStudentsCount": 0, "pickedStudentsCount": 0, "totalStudentsCountExcludingStudentsOnScheduledLeave": 0 } ], "pickedCount": 0 } }';
          TripStatusModel reponse = TripStatusModel.fromJson(jsonDecode(objText));
          emit(LoadedState(reponse));
        } on DioError catch (e) {
          String errorData = CheckNetworkError.getInstance().getNetworkError(e);
          if (errorData == "404") {
            emit(ApiFailState("Invalid User"));
          } else if (errorData == AppStrings.timeOutMsg) {
            emit(TimeOutExceptionState());
          } else {
            emit(ApiFailState(errorData));
          }
        }
      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }
}

/*class DrawPolyLineCubit extends Cubit<CommonState> {
  DrawPolyLineCubit() : super(InitialState()) {
    getPolyLines();
  }

  void getPolyLines() async {
    LatLng sourceLoc = const LatLng(0.0, 0.0);
    List<TaskModel> listOfTasks = [];
    Set<Marker> markers = {};
    List<LatLng> polyLineCoordinates = [];
    final Set<Polyline> _polyLines = {};
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        emit(LoadingState());
        try {
          LatLongOrderOfAllStopsOfVehicleScheduleModel reponse =
              await ApiRepository.getInstance("")
                  .getLatLongOrderOfAllStopsOfVehicleSchedule(scheduleId: '46');

          if (reponse.responseStatus == true) {
            *//* TaskModel model = TaskModel(
                "0", "Polyline 0", "", currentLocation!.latitude, currentLocation!.longitude, double.parse(value1.data![0].stop!.stopLatitude.toString()), double.parse(value1.data![0].stop!.stopLongitude.toString()));*//*
            TaskModel model = TaskModel(
                "0",
                "Polyline 0",
                "",
                sourceLoc.latitude,
                sourceLoc.longitude,
                double.parse(reponse.data![0].stop!.stopLatitude.toString()),
                double.parse(reponse.data![0].stop!.stopLongitude.toString()));
            listOfTasks.add(model);
            for (int i = 0; i < reponse.data!.length; i++) {
              if (i != reponse.data!.length - 1) {
                TaskModel m1 = TaskModel(
                    (i + 1).toString(),
                    "Polyline ${i + 1}",
                    "",
                    double.parse(
                        reponse.data![i].stop!.stopLatitude.toString()),
                    double.parse(
                        reponse.data![i].stop!.stopLongitude.toString()),
                    double.parse(
                        reponse.data![i + 1].stop!.stopLatitude.toString()),
                    double.parse(
                        reponse.data![i + 1].stop!.stopLongitude.toString()));
                listOfTasks.add(m1);
              }
            }
            Polyline polyline;
            if (listOfTasks.isNotEmpty) {
              for (int i = 0; i < listOfTasks.length; i++) {
                Uint8List markerIcon = await getBytesFromCanvas(i + 1, 60, 60);
                LatLng dest =
                    LatLng(listOfTasks[i].dlatitude, listOfTasks[i].dlongitude);
                markers.add(Marker(
                    markerId: MarkerId(i.toString()),
                    position: dest,
                    icon: BitmapDescriptor.fromBytes(markerIcon)));
                PolylinePoints polylinePoints = PolylinePoints();
                PolylineResult result =
                    await polylinePoints.getRouteBetweenCoordinates(
                        AppStrings.strGoogleKey,
                        PointLatLng(listOfTasks[i].slatitude,
                            listOfTasks[i].slongitude),
                        PointLatLng(listOfTasks[i].dlatitude,
                            listOfTasks[i].dlongitude),
                        travelMode: TravelMode.driving);

                print("error_message : ${result.errorMessage}");
                print("status        : ${result.status}");

                if (result.points.isNotEmpty) {
                  result.points.forEach((PointLatLng point) {
                    polyLineCoordinates
                        .add(LatLng(point.latitude, point.longitude));
                  });
                }
                polyline = Polyline(
                    polylineId: PolylineId("poly${listOfTasks[i].taskid}"),
                    color: const Color.fromARGB(204, 147, 70, 140),
                    width: 4,
                    points: polyLineCoordinates);
                _polyLines.add(polyline);
              }
            }
          }

          emit(LoadedState(_polyLines));
        } on DioError catch (e) {
          String errorData = CheckNetworkError.getInstance().getNetworkError(e);
          if (errorData == "404") {
            emit(ApiFailState("Page not found"));
          } else if (errorData == AppStrings.timeOutMsg) {
            emit(TimeOutExceptionState());
          } else {
            emit(ApiFailState(errorData));
          }
        }
      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }

  Future<Uint8List> getBytesFromCanvas(
      int customNum, int width, int height) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppColors.qatarColor;
    final Radius radius = Radius.circular(width / 2);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: customNum.toString(), // your custom number here
      style: const TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
    );

    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * .5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }
}*/

class StudentDetailsByStopCubit extends Cubit<CommonState> {
  StudentDetailsByStopCubit() : super(InitialState());

  bool isApiCall = true;

  Future<void> getStudentDetailsByStop(int i) async {
    await InternetConnectivityCheck.getInstance()
        .chkInternetConnectivity()
        .then((value) async {
      if (value!) {
        emit(LoadingState());
        try {

          StudentDataModel response = await ApiRepository.getInstance("")
              .getStudentsStatusOfGivenStopOfGivenTrip(
                  tripScheduleId: '193', stopId: '37');
          if (response.responseStatus == true) {
            emit(LoadedState(response));
          }
        } on DioError catch (e) {
          String errorData = CheckNetworkError.getInstance().getNetworkError(e);
          if (errorData == "404") {
            emit(ApiFailState("Page not found"));
          } else if (errorData == AppStrings.timeOutMsg) {
            emit(TimeOutExceptionState());
          } else {
            emit(ApiFailState(errorData));
          }
        }
      } else {
        emit(ApiFailState(AppStrings.noInternetMsg));
      }
    });
  }

  Future<Uint8List> getBytesFromCanvas(
      int customNum, int width, int height) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppColors.qatarColor;
    final Radius radius = Radius.circular(width / 2);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: customNum.toString(), // your custom number here
      style: const TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
    );

    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * .5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }
}
