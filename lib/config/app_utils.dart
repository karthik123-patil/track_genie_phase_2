

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';


class AppUtils {

  static showProgressDialog(BuildContext context, String title) {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              content: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  const CircularProgressIndicator(color: Colors.black,),
                  const Padding(padding: EdgeInsets.only(left: 15),),
                  Flexible(
                      flex: 8,
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            );
          });
    } catch (e) {
      print(e.toString());
    }
  }



  void showLoginTimeOutDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) {
        return
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: Container(
                  height: 200,
                  width: 220,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.signal_wifi_connected_no_internet_4, color: Colors.red, size: 30,)
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: DefaultTextStyle(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal
                          ),
                          child: Text("Server is not connecting. Please check the vpn and internet connection..!",
                            textAlign: TextAlign.center,

                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () async{
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context).pushNamed('/LoginScreen');
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 2),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal
                              ),
                              child: Text("Ok",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }


  void showServerErrorDialog(BuildContext context, String error) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) {
        return
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: Container(
                  height: 200,
                  width: 220,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.signal_wifi_connected_no_internet_4, color: Colors.red, size: 30,)
                        ],
                      ),
                       Padding(
                        padding:const EdgeInsets.all(12.0),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal
                          ),
                          child: Text(error,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () async{
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 2),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal
                              ),
                              child: Text("Ok",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void showDataErrorDialog(BuildContext context, String error) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) {
        return
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: Container(
                  height: 200,
                  width: 220,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.no_accounts_outlined, color: Colors.red, size: 30,)
                        ],
                      ),
                      Padding(
                        padding:const EdgeInsets.all(12.0),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal
                          ),
                          child: Text(error,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () async{
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 2),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal
                              ),
                              child: Text("Ok",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void showSuccessToastMsg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg,
      textColor: AppColors.whiteColor,
      backgroundColor: AppColors.greenColor,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }

  void showErrorToastMsg(String msg) {
    Fluttertoast.showToast(msg: msg,
      textColor: AppColors.whiteColor,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }

  static final whiteSystemTheme= SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: Colors.white,
      statusBarColor: AppColors.whiteColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark
  );

  final yellowSystemTheme= SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: Colors.white,
      statusBarColor: AppColors.bgColor.withOpacity(0.8),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark
  );

  final k30Height = const SizedBox(height: 30,);
  final k20Height = const SizedBox(height: 20,);
  final k40Height = const SizedBox(height: 40,);
  final k50Height = const SizedBox(height: 50,);
  final k60Height = const SizedBox(height: 60,);
  final k70Height = const SizedBox(height: 70,);
  final k0Height = const SizedBox(height: 0,);

  static const double cameraZoom = 18;
  static const double cameraTilt = 80;
  static const double cameraBearing = 30;
  // static const LatLng sourceLocation = LatLng(12.926485, 77.6007517);
  // static const LatLng destLocation = LatLng(12.913590, 77.615090);


  void timeOutSnackBar(BuildContext context) async {
    const snackBar = SnackBar(
      content: Text('Server is not reaching at now. Please try again after some time!!'),
      backgroundColor: AppColors.redColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void socketException(BuildContext context, String msg) async {
    final snackBar = SnackBar(
      content: Text(msg.toString()),
      backgroundColor: AppColors.redColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget internetWidget(String text,bool show){
    return Container(
      padding: const EdgeInsets.all(10.00),
      margin:  const EdgeInsets.only(bottom: 10.00),
      color: Colors.red,
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(right:6.00),
          child:  const Icon(Icons.info, color: Colors.white),
        ),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.w500, fontStyle: FontStyle.normal)),
        //show error message text
      ]),
    );
  }

  Widget internetAvailableWidget(String text,bool show){
    return Container(
      padding: const EdgeInsets.all(10.00),
      margin:  const EdgeInsets.only(bottom: 10.00),
      color: Colors.green,
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(right:6.00),
          child:  const Icon(Icons.info, color: Colors.white),
        ),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins", fontWeight: FontWeight.w500, fontStyle: FontStyle.normal)),
        //show error message text
      ]),
    );
  }

  // Future<String> getSharedPrefVal(String keyValue) async {
  //   final value = await StorageUtil.instance.getStringValue(keyValue);
  //   return value;
  // }
}
