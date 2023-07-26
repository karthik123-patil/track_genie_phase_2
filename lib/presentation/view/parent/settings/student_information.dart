import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/student_info_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/widgets/student_information_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class StudentInformationScreen extends StatelessWidget {
  const StudentInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
        appBar: const StudentInfoAppBar(
          index: 3,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: BlocConsumer<StudentInfoCubit,CommonState>(
            builder: (BuildContext context, state) {
              if(state is LoadingState){
                return Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        false ? CircleAvatar(
                          radius: 50,
                          // backgroundImage: NetworkImage(strPhoto),
                          backgroundColor: Colors.transparent,
                        )
                            : CircleAvatar(
                          radius: 50,
                          child: Image.asset(
                            'assets/images/user_img.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                    ListTile(
                      title: Text(
                        AppStrings.strStudentID,
                        style: AppTextStyles.smallTextStyle,
                      ),
                      subtitle: Text(
                        "strUniqueId",
                        style: AppTextStyles.detailsTextStyle,
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: AppColors.dividerColor,
                    ),
                    ListTile(
                      title: Text(
                        AppStrings.strStudentName,
                        style: AppTextStyles.smallTextStyle,
                      ),
                      subtitle: Text(
                        "strName",
                        style: AppTextStyles.detailsTextStyle,
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: AppColors.dividerColor,
                    ),
                    ListTile(
                      title: Text(
                        AppStrings.strContactNumber,
                        style: AppTextStyles.smallTextStyle,
                      ),
                      subtitle: Text(
                        "+91 ${"strContactNo"}",
                        style: AppTextStyles.detailsTextStyle,
                      ),
                      //trailing: Image.asset('assets/images/pencil_img.png', color: AppColors.blackColor, scale: 1.5,),
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: AppColors.dividerColor,
                    ),
                    ListTile(
                      title: Text(
                        AppStrings.strAddress,
                        style: AppTextStyles.smallTextStyle,
                      ),
                      subtitle: Text(
                        "strAddress",
                        style: AppTextStyles.detailsTextStyle,
                      ),
                      //trailing: Image.asset('assets/images/pencil_img.png', color: AppColors.blackColor, scale: 1.5,),
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: AppColors.dividerColor,
                    ),
                  ],
                );
              }else if(state is LoadingState){
                return const CircularProgressIndicator();
              }
              return Container();

            },
            listener: (BuildContext context,  state) {  },
          ),
        ),
      ),
    );
  }

}
