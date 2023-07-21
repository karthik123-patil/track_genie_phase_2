abstract class LoginEvent {}

class TextChangeEvent extends LoginEvent {
  final String username;
  final String password;

  TextChangeEvent(this.username, this.password);
}

class SubmittedEvent extends LoginEvent {
  final String username;
  final String password;
  SubmittedEvent(this.username, this.password);
}
