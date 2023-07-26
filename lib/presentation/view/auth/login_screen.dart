import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/Helper.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/auth/loginBloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/auth/login_event.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/custom_popups.dart';
import 'package:track_genie_phase_2/presentation/widgets/input-border.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

import '../../../config/colorConstant.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppUtils.whiteSystemTheme,
      child: WillPopScope(
        onWillPop: () async {
          return CustomPopups.getInstance().closeAppDialog(context);
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  AppUtils().k30Height,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              //removeTimeOutVal();
                              Navigator.of(context).pushNamed(routeRegisterAs);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColors.blackColor,
                              size: 30,
                            )),
                      ),
                      Expanded(
                        flex: 9,
                        child: Image.asset(
                          AppStrings.appContentImage,
                          scale: 1.6,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.strLogin,
                          style: AppTextStyles.registerAsStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, top: 30, bottom: 12),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.strLoginAccount,
                          style: AppTextStyles.createAcctStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18.0, top: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: employeeIdController,
                            keyboardType: TextInputType.text,
                            autofocus: LoginBloc.isFocus,
                            style: AppTextStyles.createAcctStyle,
                            decoration: InputDecoration(
                              hintText: AppStrings.hintUniqueId,
                              hintStyle: AppTextStyles.hintTextStyle,
                              errorBorder: InPutBorders.errorBorders,
                              focusedBorder: InPutBorders.focusBorders,
                              enabledBorder: InPutBorders.enableBorders,
                            ),
                            onChanged: (value) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  TextChangeEvent(employeeIdController.text,
                                      mobileNoController.text));
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                  ///mobile number ui
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: mobileNoController,
                            keyboardType: TextInputType.number,
                            style: AppTextStyles.createAcctStyle,
                            onChanged: (value) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  TextChangeEvent(employeeIdController.text,
                                      mobileNoController.text));
                            },
                            decoration: InputDecoration(
                              hintText: AppStrings.hintMobile,
                              hintStyle: AppTextStyles.hintTextStyle,
                              errorBorder: InPutBorders.errorBorders,
                              focusedBorder: InPutBorders.focusBorders,
                              enabledBorder: InPutBorders.enableBorders,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  ///login button
                  BlocConsumer<LoginBloc, CommonState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: state is! LoadingState ? 100 : 150,
                              child: ElevatedButton(
                                onPressed: state is ValidState
                                    ? () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        BlocProvider.of<LoginBloc>(context).add(
                                            SubmittedEvent(
                                                employeeIdController.text
                                                    .trim(),
                                                mobileNoController.text));
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13),
                                    backgroundColor: AppColors.bgColor,
                                    elevation: 2,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                child: state is LoadingState
                                    ? const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator(
                                          color: AppColors.blackColor,
                                          strokeWidth: 1,
                                        ),
                                      )
                                    : Text(
                                        AppStrings.strBtnLogin,
                                        style: AppTextStyles.btnTextStyle,
                                      ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    listener: (context, state) {
                      if (state is ApiSuccessState) {
                        Helper.getToastMsg(state.mapData[AppStrings.keyMapMsg]);
                        if (state.mapData[AppStrings.keyMapRegister] ==
                            AppStrings.isAdmin) {
                          Navigator.of(context).pushNamed(routeAdminBottom);
                        } else if (state.mapData[AppStrings.keyMapRegister] ==
                            AppStrings.isDriver) {
                          Navigator.of(context)
                              .pushNamed(routeVehicleScheduled);
                        } else if (state.mapData[AppStrings.keyMapRegister] ==
                            AppStrings.isStudent) {
                          Navigator.of(context).pushNamed(routeTypeOfJourney);
                        } else {
                          Navigator.of(context)
                              .pushNamed(routeVehicleScheduled);
                        }
                      } else if (state is TimeOutExceptionState) {
                        BlocProvider.of<LoginBloc>(context).add(TextChangeEvent(
                            employeeIdController.text,
                            mobileNoController.text));
                        AppUtils().showLoginTimeOutDialog(context, () {
                          Navigator.of(context, rootNavigator: true).pop();
                          // BlocProvider.of<LoginBloc>(context).add(SubmittedEvent(
                          //     employeeIdController.text,
                          //     mobileNoController.text));
                        });
                      } else if (state is ApiFailState) {
                        BlocProvider.of<LoginBloc>(context).add(TextChangeEvent(
                            employeeIdController.text,
                            mobileNoController.text));
                        Helper.getToastMsg(state.errorMessage);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
