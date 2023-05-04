part of 'fact_history_bloc.dart';

@freezed
class FactHistoryEvent with _$FactHistoryEvent {
  const factory FactHistoryEvent.started() = _Started;
  const factory FactHistoryEvent.getFactHistory() = _GetFactHistory;
}
