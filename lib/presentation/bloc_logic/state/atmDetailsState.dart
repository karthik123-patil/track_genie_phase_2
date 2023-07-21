abstract class AtmoDetailState {}

class InitialAuditHistoryState extends AtmoDetailState {}

class LoadedCompleteAuditHistoryState extends AtmoDetailState {
  final dynamic data;
  final String msg;
  LoadedCompleteAuditHistoryState({required this.data, required this.msg});
}

class LoadedPendingAuditHistoryState extends AtmoDetailState {
  final dynamic data;
  final String msg;
  LoadedPendingAuditHistoryState({required this.data, required this.msg});
}

class LoadingAuditHistoryState extends AtmoDetailState {}

class InternetLostState extends AtmoDetailState {}

class ErrorAuditHistoryState extends AtmoDetailState {
  final String error;
  ErrorAuditHistoryState({required this.error});
}
