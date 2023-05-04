import 'dart:async';
import 'dart:io';

import 'package:cat_trivia/data/consts/hive_constants.dart';
import 'package:cat_trivia/data/repository/store/local/cat_local_store_interface.dart';
import 'package:cat_trivia/presentation/model/cat.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class CatLocalStore implements CatLocalStoreInterface {
  const CatLocalStore();

  @override
  Future<List<Cat>> getFactHistory() async {
    try {
      final box = await _openBox();
      final catList = box.values.toList();
      List<Cat> result = [];
      for (var element in catList) {
        result.add(element);
      }
      return result;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addFactInHistory(Cat catFact) async {
    var box = await _openBox();
    box.add(catFact);
  }

  static void _registerAdapter() {
    if (!Hive.isAdapterRegistered(CatAdapter().typeId)) {
      Hive.registerAdapter<Cat>(CatAdapter());
    }
  }

  static Future<Box> prepare() async {
    final documents = await getApplicationDocumentsDirectory();
    Hive.init(documents.path);
    _registerAdapter();
    return _openBox();
  }

  static Future<Box> _openBox() async {
    try {
      return await Hive.openBox(hiveKey);
    } catch (e) {
      if (e is FileSystemException) {
        await Future.delayed(const Duration(seconds: 1));
        return _openBox();
      } else {
        rethrow;
      }
    }
  }
}
