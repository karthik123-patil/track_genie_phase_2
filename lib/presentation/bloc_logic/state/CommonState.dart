abstract class CommonState {}

class InitialState extends CommonState {}

class ValidState extends CommonState {}

class AlertState extends CommonState {
  final dynamic data;
  AlertState(this.data);
}

class LoadingState extends CommonState {}

class ErrorState extends CommonState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class LoadedState extends CommonState {
  final dynamic data;
  LoadedState(this.data);
}

class NoDataFoundState extends CommonState {}

class InternetLostState extends CommonState {}

class ApiSuccessState extends CommonState {
  final Map mapData;
  ApiSuccessState(this.mapData);
}

class ApiFailState extends CommonState {
  final String errorMessage;
  ApiFailState(this.errorMessage);
}

class OnSelectionState extends CommonState{
  final String roleId;
  OnSelectionState(this.roleId);
}

class TimeOutExceptionState extends CommonState{
  TimeOutExceptionState();
}
