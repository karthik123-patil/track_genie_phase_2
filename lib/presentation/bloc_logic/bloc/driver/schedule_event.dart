abstract class StartTripEvent {}

class TripButtonEvent extends StartTripEvent {
  final String userID;
  final String lat;
  final String long;
  final String scheduleId;

  TripButtonEvent(this.userID, this.lat, this.long, this.scheduleId);
}
