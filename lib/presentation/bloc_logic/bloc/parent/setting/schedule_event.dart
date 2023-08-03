abstract class ScheduleLeaveEvent {}


class ScheduleButton extends ScheduleLeaveEvent {
  final String userID;
  final String typeOfJourney;
  final String startDate;
  final String endDate;
  ScheduleButton(this.userID,  this.typeOfJourney, this.startDate, this.endDate);
}