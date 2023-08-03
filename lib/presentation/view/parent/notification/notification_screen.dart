import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/domain/model/response/student/notification_model.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/notification/notification_cubit.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import '../../../../config/colorConstant.dart';
import '../../../widgets/notification_screen_appbar.dart';
import '../../../widgets/text-style.dart';
import '../bottom/parent_bottom.dart';

class StudentNotificationScreen extends StatelessWidget {
  const StudentNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() => _onWillPop(context),
      child: Scaffold(
        appBar: const NotificationScreenAppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                  BlocConsumer<StudentNotificationCubit, CommonState> (
                    builder: (context, state) {
                      if(state is LoadedState) {
                        NotificationResModel notify = state.data as NotificationResModel;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: notify.data!.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 2),
                                  child: Row(
                                    children: [
                                      Text(
                                        notify.data![index].date.toString(),
                                        style: AppTextStyles.daysTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                notify.data![index].reachedHome != null ? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Reached Home", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].reachedHome.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                                notify.data![index].reachedSchool != null ? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Reached School", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].reachedSchool.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                                notify.data![index].missedBusOnwardJourney != null? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Missed Onward Journey Bus", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].missedBusOnwardJourney.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                                notify.data![index].pickedUpFromSchool != null ? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Picked up from school", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].pickedUpFromSchool.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                                notify.data![index].pickedUpFromHome != null ? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Picked up from home", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].pickedUpFromHome.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                                notify.data![index].missedBusReturnJourney != null ? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Missed Backward Journey Bus", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].missedBusReturnJourney.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                                notify.data![index].scheduledLeaveOnwardJourney != null ? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Schedule leave for onward journey", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].scheduledLeaveOnwardJourney.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                                notify.data![index].scheduledLeaveReturnJourney != null ? Column(
                                  children: [
                                    ListTile(
                                      title: Text("Schedule leave for backward journey", style: AppTextStyles.studentNameTextStyle,),
                                      subtitle: Text(notify.data![index].scheduledLeaveReturnJourney.toString(), style: AppTextStyles.routeTextStyle,),
                                    ),
                                    const Divider(
                                      thickness: 1.5,
                                      color: AppColors.dividerColor,
                                    )
                                  ],
                                ):Container(),
                              ],
                            );
                          },
                        );
                      }else if(state is ApiFailState) {
                        return const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No notification found", style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal
                              ),)
                            ],
                          ),
                        );
                      }else {
                        return const Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                                strokeWidth: 2,
                            ),
                          ),
                        );
                      }
                    },
                    listener: (context, state){},
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ParentBottomScreen(intCurIndex: 0)));
    return true;
  }
}
