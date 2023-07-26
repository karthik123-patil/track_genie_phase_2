import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/registerAsBloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/custom_popups.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class RegisterAsScreen extends StatelessWidget{
  const RegisterAsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterAsCubit(),
      child: BlocConsumer<RegisterAsCubit, CommonState>(
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppUtils.whiteSystemTheme,
            child: WillPopScope(
              onWillPop:() async {
               return CustomPopups.getInstance().closeAppDialog(context);
              },
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.whiteColor,
                    child: Column(
                      children: [
                        AppUtils().k70Height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppStrings.appContentImage,
                              scale: 1.6,
                            ),
                          ],
                        ),
                        AppUtils().k20Height,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.strRegisterAs,
                                style: AppTextStyles.registerAsStyle,
                              ),
                            ],
                          ),
                        ),
                        AppUtils().k20Height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///student selection card
                            InkWell(
                              onTap: () {
                                context.read<RegisterAsCubit>().onCardSelection("3");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: MediaQuery.of(context).size.height * 0.20,
                                margin: const EdgeInsets.all(5),
                                decoration:BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        AppStrings.studentImage,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: state is OnSelectionState && state.roleId == "3" ?
                                  AppColors.redColor:AppColors.whiteColor,
                                      width: 1.6),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///Driver card click
                            InkWell(
                              onTap: () {
                                context.read<RegisterAsCubit>().onCardSelection("2");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.20,
                                margin: const EdgeInsets.all(5),
                                decoration:BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        AppStrings.driverImage,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: state is OnSelectionState && state.roleId == "2" ?
                                  AppColors.redColor:AppColors.whiteColor,
                                      width: 1.6),
                                ),
                              ),
                            ),
                            ///attendant card click
                            InkWell(
                              onTap: () {
                                context.read<RegisterAsCubit>().onCardSelection("5");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.20,
                                margin: const EdgeInsets.all(5),
                                decoration:BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        AppStrings.attendantImage,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: state is OnSelectionState && state.roleId == "5" ?
                                  AppColors.redColor:AppColors.whiteColor,
                                      width: 1.6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: state is OnSelectionState ? () {
                                  Navigator.of(context).pushNamed(routeLogin);
                                  // Navigator.of(context).pushNamed(routeParentBottom);

                                }:null,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.bgColor,
                                    elevation: 2,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                                child: Text(
                                  AppStrings.strContinue,
                                  style: AppTextStyles.btnTextStyle,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                AppStrings.strByContinue,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.byContinueStyle,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {

        },

      ),
    );
  }
}

// class RegisterAsScreen extends StatefulWidget {
//   const RegisterAsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterAsScreen> createState() => _RegisterAsScreenState();
// }
//
// class _RegisterAsScreenState extends State<RegisterAsScreen> {
//   bool isStudentClk = false;
//   bool isAdminClk = false;
//   bool isDriverClk = false;
//   bool isAttendantClk = false;
//   String strRegisterAs = "";
//   String strRoleID = "";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer(
//       builder: (BuildContext context, state) {
//         return AnnotatedRegion<SystemUiOverlayStyle>(
//           value: AppUtils.whiteSystemTheme,
//           child: WillPopScope(
//             onWillPop: _closeAppDialog,
//             child: Scaffold(
//               body: SingleChildScrollView(
//                 physics: const ScrollPhysics(),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   color: AppColors.whiteColor,
//                   child: Column(
//                     children: [
//                       AppUtils().k70Height,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             AppStrings.appContentImage,
//                             scale: 1.6,
//                           ),
//                         ],
//                       ),
//                       AppUtils().k20Height,
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Text(
//                               AppStrings.strRegisterAs,
//                               style: AppTextStyles.registerAsStyle,
//                             ),
//                           ],
//                         ),
//                       ),
//                       AppUtils().k20Height,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           isStudentClk
//                               ? Container(
//                             width: MediaQuery.of(context).size.width * 0.65,
//                             height: MediaQuery.of(context).size.height * 0.20,
//                             margin: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               image: const DecorationImage(
//                                   image: AssetImage(
//                                     'assets/images/img.png',
//                                   ),
//                                   fit: BoxFit.cover),
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                               border: Border.all(
//                                   color: AppColors.redColor, width: 1.6),
//                             ),
//                           )
//                               : InkWell(
//                             onTap: () {
//                               setState(() {
//                                 isStudentClk = true;
//                                 isAdminClk = false;
//                                 isDriverClk = false;
//                                 isAttendantClk = false;
//                                 strRegisterAs = "Student";
//                                 strRoleID = "3";
//                               });
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.65,
//                               height: MediaQuery.of(context).size.height * 0.20,
//                               margin: const EdgeInsets.all(5),
//                               decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                       'assets/images/img.png',
//                                     ),
//                                     fit: BoxFit.cover),
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(10)),
//                               ),
//                             ),
//                           ),
//                           /* isAdminClk
//                             ? Container(
//                           width: MediaQuery.of(context).size.width * 0.45,
//                           height: MediaQuery.of(context).size.height * 0.20,
//                           margin: const EdgeInsets.all(5),
//                           decoration: BoxDecoration(
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'assets/images/img_1.png',
//                               ),
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius:
//                             const BorderRadius.all(Radius.circular(10)),
//                             border: Border.all(
//                                 color: AppColors.redColor, width: 1.5),
//                           ),
//                         )
//                             : InkWell(
//                           onTap: () {
//                             setState(() {
//                               isAdminClk = true;
//                               isStudentClk = false;
//                               isDriverClk = false;
//                               isAttendantClk = false;
//                               strRegisterAs = "Admin";
//                               strRoleID = "1";
//                             });
//                           },
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.45,
//                             height: MediaQuery.of(context).size.height * 0.20,
//                             margin: const EdgeInsets.all(5),
//                             decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                   'assets/images/img_1.png',
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                             ),
//                           ),
//                         ),*/
//                         ],
//                       ),
//                       const SizedBox(height: 10,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           isDriverClk
//                               ? Container(
//                             width: MediaQuery.of(context).size.width * 0.45,
//                             height: MediaQuery.of(context).size.height * 0.20,
//                             margin: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               image: const DecorationImage(
//                                   image: AssetImage(
//                                     'assets/images/img_2.png',
//                                   ),
//                                   fit: BoxFit.cover),
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                               border: Border.all(
//                                   color: AppColors.redColor, width: 1.6),
//                             ),
//                           )
//                               : InkWell(
//                             onTap: () {
//                               setState(() {
//                                 isDriverClk = true;
//                                 isAdminClk = false;
//                                 isStudentClk = false;
//                                 isAttendantClk = false;
//                                 strRegisterAs = "Driver";
//                                 strRoleID = "4";
//                               });
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.45,
//                               height: MediaQuery.of(context).size.height * 0.20,
//                               margin: const EdgeInsets.all(5),
//                               decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                       'assets/images/img_2.png',
//                                     ),
//                                     fit: BoxFit.cover),
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(10)),
//                               ),
//                             ),
//                           ),
//                           isAttendantClk
//                               ? Container(
//                             width: MediaQuery.of(context).size.width * 0.45,
//                             height: MediaQuery.of(context).size.height * 0.20,
//                             margin: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               image: const DecorationImage(
//                                   image: AssetImage(
//                                     'assets/images/img_3.png',
//                                   ),
//                                   fit: BoxFit.cover),
//                               borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                               border: Border.all(
//                                   color: AppColors.redColor, width: 1.6),
//                             ),
//                           )
//                               : InkWell(
//                             onTap: () {
//                               setState(() {
//                                 isAttendantClk = true;
//                                 isAdminClk = false;
//                                 isStudentClk = false;
//                                 isDriverClk = false;
//                                 strRegisterAs = "Attendant";
//                                 strRoleID = "5";
//                               });
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.45,
//                               height: MediaQuery.of(context).size.height * 0.20,
//                               margin: const EdgeInsets.all(5),
//                               decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                       'assets/images/img_3.png',
//                                     ),
//                                     fit: BoxFit.cover),
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(10)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: 200,
//                             height: 50,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 if (strRegisterAs.isEmpty || strRegisterAs == "") {
//                                   AppUtils().showErrorToastMsg(
//                                       "Please select any one of the card");
//                                 } else {
//                                   StorageUtil.instance.setStringValue(
//                                       AppStrings.strPrefRegisterAs, strRegisterAs);
//                                   StorageUtil.instance.setStringValue(
//                                       AppStrings.strPrefRoleId, strRoleID);
//                                   //Navigator.of(context).pushNamed('/VehicleScheduledScreen');
//                                   Navigator.of(context).pushNamed('/LoginScreen');
//                                 }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: AppColors.bgColor,
//                                   elevation: 2,
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(15)))),
//                               child: Text(
//                                 AppStrings.strContinue,
//                                 style: AppTextStyles.btnTextStyle,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       const Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               AppStrings.strByContinue,
//                               textAlign: TextAlign.center,
//                               style: AppTextStyles.byContinueStyle,
//                             )
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       listener: (BuildContext context, Object? state) {  },
//
//     );
//   }
//
//   Future<bool> _closeAppDialog() async {
//     return (await showDialog(
//       barrierDismissible: false,
//       barrierColor: Colors.transparent,
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Are you sure?', style: TextStyle(
//             color: Colors.redAccent,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 0.2
//         ),),
//         content: const Text('Do you want to exit an App',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w400,
//                 letterSpacing: 0.2
//             )
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: const Text('No',
//                 style: TextStyle(
//                     color: Colors.redAccent,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 0.2
//                 )
//             ),
//           ),
//           TextButton(
//             onPressed: (){
//               StorageUtil.instance.removeAll();
//               exit(0);
//             },
//             child: const Text('Yes',
//                 style: TextStyle(
//                     color: AppColors.blueColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 0.2
//                 )
//             ),
//           ),
//         ],
//       ),
//     )) ?? false;
//   }
// }
