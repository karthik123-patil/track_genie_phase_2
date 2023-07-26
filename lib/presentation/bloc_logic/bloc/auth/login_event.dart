abstract class LoginEvent {}

class TextChangeEvent extends LoginEvent {
  final String userID;
  final String mobileNumber;
  TextChangeEvent(this.userID, this.mobileNumber);
}

class SubmittedEvent extends LoginEvent {
  final String userID;
  final String mobileNumber;

  SubmittedEvent(this.userID, this.mobileNumber);
}
