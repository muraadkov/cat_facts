part of 'cat_bloc.dart';

@freezed
class CatEvent with _$CatEvent {
  const factory CatEvent.started() = _Started;
  const factory CatEvent.fetchCatFact() = _FetchCatFact;
}
