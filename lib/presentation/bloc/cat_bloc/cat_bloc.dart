import 'package:bloc/bloc.dart';
import 'package:cat_trivia/data/consts/api_constants.dart';
import 'package:cat_trivia/domain/interactor/cat_interactor.dart';
import 'package:cat_trivia/presentation/model/cat.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_bloc.freezed.dart';
part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatInteractor _catInteractor;
  CatBloc(this._catInteractor) : super(const CatState.initial()) {
    on<_FetchCatFact>(_fetchCatFact);
  }

  Future<void> _fetchCatFact(event, emit) async {
    emit(const _Loading());
    await refreshImage();
    await _catInteractor.fetchCatFact().then((cat) async {
      if (cat != null) {
        await _addFactInHive(cat);
        emit(_Success(cat));
      }
    }).catchError((error) => emit(_Error(error.toString())));
  }

  Future<void> refreshImage() async {
    const networkImage = NetworkImage(ApiConstants.catImageUrl);
    networkImage.evict();
  }

  Future<void> _addFactInHive(Cat cat) async {
    await _catInteractor.addCatFact(cat);
  }
}
