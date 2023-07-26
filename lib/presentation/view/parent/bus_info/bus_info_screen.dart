import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/Helper.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/domain/model/response/bus_info_model.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/bus_info/bus_info_cubit.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/widgets/custom_popups.dart';
import 'package:track_genie_phase_2/presentation/widgets/parent_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class BusInfoScreen extends StatelessWidget {
  const BusInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return CustomPopups.getInstance().onWillPop(context);
      },
      child: Scaffold(
        appBar: const ParentAppBar(
          index: 1,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.whiteColor,
            child: BlocConsumer<BusInfoCubit, CommonState>(
              builder: (BuildContext context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                        color: AppColors.redColor,
                        strokeWidth: 2,
                      ),
                    ),
                  );
                } else if (state is LoadedState) {
                  BusInfoModel responseData = state.data as BusInfoModel;
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bus Route Name",
                                  style: AppTextStyles.smallTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  responseData.data!.routeName.toString(),
                                  style: AppTextStyles.detailsTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: AppColors.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vehicle No",
                                  style: AppTextStyles.smallTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  responseData
                                      .data!.vehicleRegisterationNumber
                                      .toString(),
                                  style: AppTextStyles.detailsTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: AppColors.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vehicle Type",
                                  style: AppTextStyles.smallTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  responseData.data!.vehicleType.toString(),
                                  style: AppTextStyles.detailsTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: AppColors.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.strDriverName,
                                  style: AppTextStyles.smallTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  responseData.data!.drivers![0].userName
                                      .toString(),
                                  style: AppTextStyles.detailsTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: AppColors.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Driver Contact",
                                  style: AppTextStyles.smallTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "+91 ${responseData.data!.drivers![0].userPhoneNumber.toString()}",
                                  style: AppTextStyles.detailsTextStyle,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Helper.makePhoneCall(responseData
                                    .data!.drivers![0].userPhoneNumber
                                    .toString());
                              },
                              child: Column(
                                children: [
                                  Image.asset(AppStrings.callImage)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: AppColors.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Attendant Name",
                                  style: AppTextStyles.smallTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  responseData.data!.attendants![0].userName
                                      .toString(),
                                  style: AppTextStyles.detailsTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: AppColors.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Attendant Contact",
                                  style: AppTextStyles.smallTextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "+91 ${responseData.data!.attendants![0].userPhoneNumber.toString()}",
                                  style: AppTextStyles.detailsTextStyle,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                Helper.makePhoneCall(responseData
                                    .data!.attendants![0].userPhoneNumber
                                    .toString());
                              },

                              child: Column(
                                children: [Image.asset(AppStrings.callImage)],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: AppColors.dividerColor,
                      ),
                    ],
                  );
                }
                return Container();
              },
              listener: (BuildContext context, state) {},
            )),
      ),
    );
  }
}
