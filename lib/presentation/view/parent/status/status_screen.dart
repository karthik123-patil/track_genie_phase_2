import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';

import 'dart:math' show cos, sqrt, asin;

import 'package:track_genie_phase_2/presentation/widgets/custom_popups.dart';
import 'package:track_genie_phase_2/presentation/widgets/status_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class ParentStatusScreen extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng currentLocations = const LatLng(0.0, 0.0);
  Set<Marker> markers = {};
  final Set<Polyline> _polyLines = {};

  ParentStatusScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition =  CameraPosition(
        zoom: AppStrings().cameraZoom,
        bearing: AppStrings().cameraBearing,
        tilt: AppStrings().cameraTilt,
        target: AppUtils.sourceLocation);
    if (currentLocations.latitude.isNaN) {
      initialCameraPosition = CameraPosition(
          zoom: AppStrings().cameraZoom,
          bearing: AppStrings().cameraBearing,
          tilt: AppStrings().cameraTilt,
          target: LatLng(currentLocations.latitude, currentLocations.longitude));
    }
    return Scaffold(
      appBar: StatusAppBar(
        index: 0,
        strTxt: (String val) {
          //onClickOnLogout(val);
        },
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.whiteColor,
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                SlidingUpPanel(
                  maxHeight: 150,
                  minHeight: 150,
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
                              compassEnabled: true,
                              tiltGesturesEnabled: false,
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              initialCameraPosition: initialCameraPosition,
                              markers: markers,
                              polylines: _polyLines,
                              onMapCreated: (mapController) {
                                _controller.complete(mapController);
                              },
                              onCameraMove: (position) {
                                // if (kDebugMode) {
                                //   print(
                                //       "Pos ${position.target.latitude.toStringAsFixed(3)}");
                                //   print("Curr ${currentLocations.latitude}");
                                // }
                                // if (position.target.latitude
                                //         .toStringAsFixed(3) ==
                                //     currentLocations.latitude
                                //         .toStringAsFixed(3)) {
                                //   setState(() {
                                //     isShowRecenter = false;
                                //   });
                                // } else {
                                //   setState(() {
                                //     isShowRecenter = true;
                                //   });
                                // }
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
                                  // if (kDebugMode) {
                                  //   print(
                                  //       "CUR ${currentLocations.latitude}${currentLocations.longitude}");
                                  // }
                                  // if (currentLocations.latitude == 0.0 &&
                                  //     currentLocations.longitude == 0.0) {
                                  //   GoogleMapController googleMapController =
                                  //       await _controller.future;
                                  //   googleMapController.animateCamera(
                                  //       CameraUpdate.newCameraPosition(
                                  //           CameraPosition(
                                  //               zoom: AppStrings().cameraZoom,
                                  //               bearing:
                                  //                   AppStrings().cameraBearing,
                                  //               tilt: AppStrings().cameraTilt,
                                  //               target: LatLng(
                                  //                   destination.latitude,
                                  //                   destination.longitude))));
                                  // } else {
                                  //   GoogleMapController googleMapController =
                                  //       await _controller.future;
                                  //   googleMapController.animateCamera(
                                  //       CameraUpdate.newCameraPosition(
                                  //           CameraPosition(
                                  //               zoom: AppStrings().cameraZoom,
                                  //               bearing:
                                  //                   AppStrings().cameraBearing,
                                  //               tilt: AppStrings().cameraTilt,
                                  //               target: LatLng(
                                  //                   currentLocations.latitude,
                                  //                   currentLocations
                                  //                       .longitude))));
                                  // }
                                },
                                label: const Text(
                                  "Recenter",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                  panelBuilder: (sc) {
                    return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12.0))),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            "timeToReachStop" != "null"
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "timeToReachStop",
                                        style: AppTextStyles.stopsStyle1,
                                      ),
                                    ],
                                  )
                                : Container(),
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
                                          color: Color.fromRGBO(0, 0, 0, .25),
                                          blurRadius: 16.0)
                                    ],
                                  ),
                                  child: Text(
                                    "studentStatus",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.noOfInStyle,
                                  ),
                                ),
                              ],
                            ),
                            "item.stopsByTripId.tripStatus" ==
                                    "Trip is not started."
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\nTrip starts on: ",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColors.blueColor,
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins"),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  )
                                : Container(),
                            /* const SizedBox(
                                height: 0.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0, left: 20),
                                child: AnotherStepper(
                                  stepperList: item.stopsByTripId.data!.map((items){
                                    return StepperData(
                                        title: StepperText("STA ${items.scheduledArrivalTime.toString()}", textStyle: AppTextStyles.busTimingStyle),
                                        subtitle: StepperText(
                                            items.location != null ?
                                            "${items.location},\n ${items.stop!.stopName.toString()}"
                                                : items.stop!.stopName.toString(),
                                            textStyle: items.location != null ? AppTextStyles.yourLocation :AppTextStyles.selectedItemStyle),
                                        iconWidget: items.status == "Child onboarded" ? Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                              color: AppColors.greenColor,
                                              borderRadius: BorderRadius.all(Radius.circular(30))),
                                          child: const Icon(Icons.check, color: Colors.white),
                                        ): items.status ==  "Child not onboarded" ? Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                              color: AppColors.redColor,
                                              borderRadius: BorderRadius.all(Radius.circular(30))),
                                          child: const Icon(Icons.close, color: Colors.white),
                                        ) : items.status ==  "Child on scheduled leave" ? Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                              color: AppColors.redColor,
                                              borderRadius: BorderRadius.all(Radius.circular(30))),
                                          child: const Icon(Icons.close, color: Colors.white),
                                        ) : items.stopOrder ==  1 ?
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          child: Image.asset('assets/images/track_vehicle_img.png'),
                                        )
                                            :Container(
                                          height: 40,
                                          width: 40,
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                              color: AppColors.loginHereColor,
                                              borderRadius: BorderRadius.all(Radius.circular(30))),
                                        ));
                                  }).toList(),
                                  stepperDirection: Axis.vertical,
                                  activeBarColor: AppColors.darkGrey,
                                  iconWidth: 30,
                                  iconHeight: 30,
                                  inActiveBarColor: AppColors.lineColor1,
                                  activeIndex: item.stopsByTripId.data!.length,
                                  barThickness: 5,

                                ),
                              ),*/
                          ],
                        ));
                  },
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
