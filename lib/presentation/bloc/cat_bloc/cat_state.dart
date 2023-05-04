part of 'cat_bloc.dart';

@freezed
class CatState with _$CatState {
  const factory CatState.initial() = _Initial;
  const factory CatState.loading() = _Loading;
  const factory CatState.success(Cat cat) = _Success;
  const factory CatState.error(String error) = _Error;
}
