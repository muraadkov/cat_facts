import 'package:cat_trivia/data/repository/interface/cat_repository_interface.dart';
import 'package:cat_trivia/data/repository/store/cloud/cat_cloud_store.dart';
import 'package:cat_trivia/data/repository/store/local/cat_local_store.dart';
import 'package:cat_trivia/domain/object/cat_response.dart';
import 'package:cat_trivia/presentation/model/cat.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CatRepository implements CatRepositoryInterface {
  final CatCloudStore _catCloudStore;
  final CatLocalStore _catLocalStore;

  CatRepository(this._catCloudStore, this._catLocalStore);

  @override
  Future<void> addCatFact(Cat catFact) async {
    await _catLocalStore.addFactInHistory(catFact).onError((error, stackTrace) {
      debugPrint('addCatFact: $error, stackTrace: $stackTrace');
    });
  }

  @override
  Future<CatResponse?> fetchCatFact() async {
    try {
      final catResponse = await _catCloudStore.getCatFact().onError((error, stackTrace) {
        debugPrint('fetchCatFact(): $error, stackTrace: $stackTrace');
        return null;
      });
      return catResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Cat>> getFactHistory() async {
    return await _catLocalStore.getFactHistory().onError((error, stackTrace) {
      debugPrint('getFactHistory(): $error, stackTrace: $stackTrace');
      return [];
    });
  }
}
