part of 'fact_history_bloc.dart';

@freezed
class FactHistoryState with _$FactHistoryState {
  const factory FactHistoryState.initial() = _Initial;
  const factory FactHistoryState.loading() = _Loading;
  const factory FactHistoryState.success(List<Cat> catList) = _Success;
  const factory FactHistoryState.error(String error) = _Error;
}
