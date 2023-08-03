abstract class  CancelLeaveEvent {}

class CancelButton extends CancelLeaveEvent {
  final String date;
  final String journeyId;
  CancelButton(this.date, this.journeyId);
}