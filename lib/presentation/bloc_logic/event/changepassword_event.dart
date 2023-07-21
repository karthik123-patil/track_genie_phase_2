abstract class PasswordChangeEvent {}

class TextChangeEvent extends PasswordChangeEvent {
  final String username;
  final String password;
  final String confirmPassword;

  TextChangeEvent(this.username, this.password, this.confirmPassword);
}

class SubmittedEvent extends PasswordChangeEvent {
  final String username;
  final String password;
  final String confirmPassword;

  SubmittedEvent(this.username, this.password, this.confirmPassword);
}
