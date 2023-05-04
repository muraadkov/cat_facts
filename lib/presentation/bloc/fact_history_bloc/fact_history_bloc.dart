import 'package:bloc/bloc.dart';
import 'package:cat_trivia/domain/interactor/cat_interactor.dart';
import 'package:cat_trivia/presentation/model/cat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_history_bloc.freezed.dart';
part 'fact_history_event.dart';
part 'fact_history_state.dart';

class FactHistoryBloc extends Bloc<FactHistoryEvent, FactHistoryState> {
  final CatInteractor _catInteractor;
  FactHistoryBloc(this._catInteractor) : super(const FactHistoryState.initial()) {
    on<_GetFactHistory>(_getFactHistory);
  }

  Future<void> _getFactHistory(event, emit) async {
    emit(const _Loading());
    await _catInteractor.getFactHistory().then((catList) async {
      emit(_Success(catList));
    }).catchError((error) => emit(_Error(error.toString())));
  }
}
