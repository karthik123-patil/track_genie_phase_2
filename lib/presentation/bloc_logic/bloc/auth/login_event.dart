abstract class LoginEvent {}

class TextChangeEvent extends LoginEvent {
  final String userID;
  final String mobileNumber;
  TextChangeEvent(this.userID, this.mobileNumber);
}

class SubmittedEvent extends LoginEvent {
  final String userID;
  final String mobileNumber;
  final String roleId;

  SubmittedEvent(this.userID, this.mobileNumber, this.roleId);
}
