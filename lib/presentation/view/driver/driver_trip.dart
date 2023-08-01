import 'dart:async';

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/driver/driver_trip_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/widgets/driver_home_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

import '../../../config/app_utils.dart';
import '../../../domain/model/response/TripStatusModel.dart';

class DriverTripScreen extends StatelessWidget {
  DriverTripScreen({super.key});

  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 95.0;
  Set<Marker> markers = {};
  Position? currentLocation;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  final Set<Polyline> _polyLines = {};
  final Completer<GoogleMapController> _controller = Completer();
  TripStatusModel tripStatusModel = TripStatusModel();

  @override
  Widget build(BuildContext context) {

    CameraPosition initialCameraPosition =  CameraPosition(
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
          position: LatLng(currentLocation!.latitude,
              currentLocation!.longitude),
        ),
      );
    }
    _panelHeightOpen = MediaQuery.of(context).size.height * .50;

    return BlocProvider(
      create: (context) => DriverTripCubit(),
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: DriverHomeAppBar(onClickLogOut: (String val) {
            // onClickOnLogOut(val);
          }),
          body: BlocConsumer<DriverTripCubit,CommonState>(

            builder: (BuildContext context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.whiteColor,
                child: Stack(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        SlidingUpPanel(
                          maxHeight: _panelHeightOpen,
                          minHeight: _panelHeightClosed,
                          parallaxEnabled: true,
                          parallaxOffset: .5,
                          isDraggable: true,
                          panelSnapping: true,
                          slideDirection: SlideDirection.UP,
                          defaultPanelState: PanelState.OPEN,
                          body: Stack(
                            children: [
                              "null" == null
                                  ? Center(
                                  child: Text(
                                    "Loading...",
                                    style: AppTextStyles.appBarTextStyle,
                                  ))
                                  : GoogleMap(
                                liteModeEnabled: false,
                                compassEnabled: true,
                                tiltGesturesEnabled: false,
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                initialCameraPosition: initialCameraPosition,
                                markers: markers,
                                polylines: _polyLines,
                                onMapCreated: (mapController) {
                                  // _controller.complete(mapController);
                                },
                                onCameraMove: (position) {

                                },
                              ),
                              true
                                  ? Positioned(
                                top: 320,
                                left: 10,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(30))),
                                  icon: const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    GoogleMapController googleMapController =
                                    await _controller.future;
                                    googleMapController.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                zoom: AppStrings().cameraZoom,
                                                bearing:
                                                AppStrings().cameraBearing,
                                                tilt: AppStrings().cameraTilt,
                                                target: LatLng(
                                                    currentLocation!.latitude,
                                                    currentLocation!
                                                        .longitude))));
                                  },
                                  label: const Text(
                                    "Recenter",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                                  : Container()
                            ],
                          ),
                          panelBuilder: (sc) => FutureBuilder(
                            // future: getStopsDataWithTime(),
                            builder: (BuildContext context,
                                AsyncSnapshot<TripStatusModel> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.responseStatus == true) {
                                  return StreamBuilder(
                                    // stream: getSignInStream,
                                      initialData: tripStatusModel,
                                      builder: (context, snapshotStr) {
                                        return _panel(
                                            sc,
                                            tripStatusModel.data!.totalStops
                                                .toString(),
                                            tripStatusModel.data!.pickedCount
                                                .toString(),
                                            tripStatusModel.data!
                                                .totalCountExcludingStudentsOnScheduledLeave
                                                .toString(),
                                            snapshot.data!.data!.list!.toList(),
                                            tripStatusModel
                                                .data!.passengerStatusMessage
                                                .toString(),
                                            int.parse(tripStatusModel
                                                .data!.missedBusCount
                                                .toString()),context);
                                      });
                                } else {
                                  return const Center(
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return const Center(
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              topRight: Radius.circular(18.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            listener: (BuildContext context, Object? state) {  },

          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: AppColors.redColor,
                onPressed: () {
                  // endTripProcessContinue();
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Text(
                  "End",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _panel(ScrollController sc, String routeCount, String pickedCount,
      String totalCount, List<StopsList> stopsData, String passengerStatus,  int missedBusCount,BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: stopsData.isEmpty? const Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2,),
          ),
        ) :ListView(
          controller: sc,
          children: <Widget>[
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$routeCount Stops",
                  style: AppTextStyles.stopsStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
                    ],
                  ),
                  child: Text(
                    missedBusCount != 0 ? "$pickedCount of $totalCount $passengerStatus ($missedBusCount)" : "$pickedCount of $totalCount $passengerStatus",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.noOfInStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 0.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, bottom: 5),
              child: AnotherStepper(
                stepperList: stopsData.map((item) {
                  return StepperData(
                      title:StepperText(
                          item.scheduledArrivalTime.toString(),
                          textStyle: AppTextStyles.busTimingStyle),
                      subtitle: StepperText(item.stop!.stopName.toString(),
                          textStyle: AppTextStyles.selectedItemStyle),
                      iconWidget: InkWell(
                        onTap: () {
                          // getStudentDetailsByStop(item.stop!.stopID.toString());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: item.missedBusStudentsCount !=  0 ?  AppColors.grey500 :
                              (item.pickedStudentsCount
                                  .toString() !=
                                  item.totalStudentsCountExcludingStudentsOnScheduledLeave
                                      .toString() &&
                                  item.pickedStudentsCount
                                      .toString() !=
                                      "0")? AppColors.pinkColor :
                              (item.pickedStudentsCount
                                  .toString() ==
                                  item.totalStudentsCountExcludingStudentsOnScheduledLeave
                                      .toString() &&
                                  item.totalStudentsCountExcludingStudentsOnScheduledLeave
                                      .toString() !=
                                      "0")
                                  ? AppColors.greenColor
                                  : AppColors.bgColor,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                          child: Center(
                              child: Text(
                                "${item.pickedStudentsCount.toString()}/${item.totalStudentsCountExcludingStudentsOnScheduledLeave.toString()}",
                                style: TextStyle(
                                    color: item.missedBusStudentsCount != 0 ?  AppColors.whiteColor : (item.pickedStudentsCount
                                        .toString() ==
                                        item.totalStudentsCountExcludingStudentsOnScheduledLeave
                                            .toString())
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins"),
                              )),
                        ),
                      ));
                }).toList(),
                stepperDirection: Axis.vertical,
                activeBarColor: AppColors.darkGrey,
                iconWidth: 40,
                iconHeight: 40,
                inActiveBarColor: AppColors.lineColor1,
                activeIndex: stopsData.length,
                barThickness: 4,
              ),
            ),
          ],
        ));
  }
}
