import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:track_genie_phase_2/config/app_utils.dart';
import 'package:track_genie_phase_2/domain/model/response/student/get_leaves_model.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/cancel_event.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/cancel_leave_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/view/parent/bottom/parent_bottom.dart';
import '../../../../config/Helper.dart';
import '../../../../config/colorConstant.dart';
import '../../../../config/shared_preferences.dart';
import '../../../../config/strings.dart';
import '../../../bloc_logic/bloc/parent/setting/get_leaves_bloc.dart';

class CancelLeaveScreen extends StatelessWidget {
   CancelLeaveScreen({Key? key}) : super(key: key);
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime passDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        backgroundColor: AppColors.bgColor,
        title: Text(AppStrings.title, style: const TextStyle(color: AppColors.blackColor),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocConsumer<GetLeavesCubit, CommonState>(
              builder: (context, state) {
                if(state is LoadedState) {
                  GetScheduledLeave leaves = state.data as GetScheduledLeave;
                  return TableCalendar(
                    focusedDay: selectedDay,
                    firstDay: selectedDay,
                    lastDay: DateTime(2050),
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat format) {
                      format = format;
                    },
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    daysOfWeekVisible: true,

                    //Day Changed
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      passDay = selectDay;
                      focusedDay = focusDay;
                      _cancelLeaveDialog(context);
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(passDay, date);
                    },
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        if(leaves.data!.isNotEmpty) {
                          for(int i=0; i < leaves.data!.length; i++) {
                            DateTime dd = DateTime.parse(leaves.data![i]);
                            if (day.day < dd.day &&
                                day.month < dd.month &&
                                day.year < dd.year) {
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(2.0),
                                decoration: const BoxDecoration(
                                  color: AppColors.unSelectedColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            }else if (day.day == dd.day &&
                                day.month == dd.month &&
                                day.year == dd.year) {
                              return Container(
                                padding: const EdgeInsets.all(6.0),
                                margin: const EdgeInsets.all(2.0),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: const TextStyle(color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                        }
                        return null;
                      },
                    ),
                    calendarStyle: CalendarStyle(
                      selectedTextStyle: const TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),

                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: true,
                      titleCentered: true,
                      formatButtonShowsNext: false,
                      formatButtonDecoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      formatButtonTextStyle: const TextStyle(
                        color: AppColors.blackColor,
                      ),
                    ),
                  );
                }/*else if(state is ApiFailState) {
                  return const Center(
                    child: Text(
                      "No Leave Data Found",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.normal
                      ),
                    ),
                  );
                }*/else{
                  return const SizedBox(
                    height: 400,
                    child:  Center(
                      child: Text(
                        "No Leave Data Found",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                    ),
                  );
                }
              }, listener: (BuildContext context,  state) {  }),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:  AppColors.kSecondaryColor ,
                    )),
                const SizedBox(width: 20,),
                const Text(
                  "Today Date",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:  AppColors.redColor ,
                    )),
                const SizedBox(width: 20,),
                const Text(
                  "Schedule Leave Date",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   Future<bool> _cancelLeaveDialog(BuildContext context) async {
     return (await showDialog(
       barrierDismissible: false,
       barrierColor: Colors.transparent,
       context: context,
       builder: (context) => BlocProvider(create: (context)=> CancelLeaveBloc(),
        child: AlertDialog(
          title: const Text(
            'Are you sure?',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2),
          ),
          content: const Text('Do you want to cancel the leave for this day',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2)),
            ),
            BlocConsumer<CancelLeaveBloc, CommonState>(
              builder: (context, state){
                return TextButton(
                  onPressed: () async{
                    String journeyId = await StorageUtil.instance.getStringValue(AppStrings.strPrefJourneyId);
                    String date = passDay.toString().substring(0, 10);
                    BlocProvider.of<CancelLeaveBloc>(context).add(
                        CancelButton(date, journeyId)
                    );
                    // deleteSchLeave();
                  },
                  child: const Text('Yes',
                      style: TextStyle(
                          color: AppColors.blueColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2)),
                );
              },
              listener: (context, state) {
                if(state is LoadingState) {
                  AppUtils.showProgressDialog(context, "Please wait...");
                }else if(state is ApiSuccessState){
                  Helper.getToastMsg(state.mapData[AppStrings.keyMapMsg]);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ParentBottomScreen(intCurIndex: 3)));
                }else if (state is ApiFailState) {
                  Navigator.of(context).pop(true);
                  Helper.getToastMsg(state.errorMessage);
                  Navigator.of(context).pop();
                }
              },
            )

          ],
        ),
       ),
     )) ??
         false;
   }
}
