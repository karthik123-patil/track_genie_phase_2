import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/Helper.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/contacts/parent_contact_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/widgets/parent_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

import '../../../../domain/model/response/school_contact.dart';

class ParentContactScreen extends StatelessWidget {
  const ParentContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        exit(0);
      },
      child: Scaffold(
        appBar: const ParentAppBar(index: 2,),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.whiteColor,
            child: BlocConsumer<ParentContactCubit,CommonState>(
              builder: (BuildContext context, state) {
                if(state is LoadingState){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is LoadedState){
                  GetSchoolContacts responseData = state.data as GetSchoolContacts;
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: responseData.data!.schoolAdministrator!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "School Administrator",
                                          style: AppTextStyles.smallTextStyle,
                                        ),
                                        const SizedBox(height: 10,),
                                        Text(
                                          "+91 ${responseData.data!.schoolAdministrator![index]}",
                                          style: AppTextStyles.detailsTextStyle,
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Helper.makePhoneCall(responseData.data!.schoolAdministrator![index].toString());
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
                            ],
                          );
                        },
                      ),
                      responseData.data!.schoolFrontDesk != "null" ?
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "School Front Desk",
                                      style: AppTextStyles.smallTextStyle,
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(
                                      "+91 ${responseData.data!.schoolFrontDesk}",
                                      style: AppTextStyles.detailsTextStyle,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    Helper.makePhoneCall(responseData.data!.schoolFrontDesk.toString());
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
                        ],
                      ):Container(),

                    ],
                  );
                }
                return Container();
              },
              listener: (BuildContext context,  state) {  },

            ),
          ),
        ),
      )
    );
  }
}
