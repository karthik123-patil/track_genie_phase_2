import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/status/type_of_journey_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class TypeOFJourneyScreen extends StatelessWidget{
  TypeOFJourneyScreen({super.key});
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppUtils.whiteSystemTheme,
      child: WillPopScope(
        onWillPop: (){
          exit(0);
        },
        child: Scaffold(
          body: BlocConsumer<TypeOFJourneyCubit,CommonState>(
            builder: (BuildContext context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.whiteColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppUtils().k30Height,
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () => Navigator.of(context).pushNamed(routeLogin),
                                icon: const Icon(Icons.arrow_back, color: AppColors.blackColor, size: 30,)
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child:Image.asset(AppStrings.appContentImage, scale: 1.6,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              AppStrings.strStartTheTrip,
                              style: AppTextStyles.registerAsStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 30, bottom: 12),
                        child: Column(
                          children: [
                            Text(
                              AppStrings.strToTrack,
                              style: AppTextStyles.createAcctStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                isExpanded:true,
                                decoration: InputDecoration(
                                  label: Text("Journey", style: AppTextStyles.studentNameTextStyle,),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                dropdownColor: Colors.white,
                                value: selectedValue,
                                items: AppStrings.journeyList.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item
                                        .toString(),
                                    child: Text(
                                      item
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                hint:const Text(
                                  "Select Journey",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (String? value) {
                                  context.read<TypeOFJourneyCubit>().onJourneySelect(value!);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Padding(
                        padding: const  EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: state is OnSelectionState ? () {

                                  Navigator.of(context).pushNamed(routeParentBottom);
                                  // context.read<TypeOFJourneyCubit>().startTheTrip();
                                }:null,
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 13),
                                    backgroundColor: AppColors.bgColor,
                                    elevation: 2,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    )
                                ),
                                child: state is LoadingState ? const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: AppColors.blackColor,
                                    strokeWidth: 1,
                                  ),
                                ): Text(AppStrings.strStartTrip,
                                  style: AppTextStyles.btnTextStyle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (BuildContext context,  state) {  },

          ),
        ),
      ),
    );
  }

}
