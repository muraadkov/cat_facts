import 'package:cat_trivia/presentation/model/cat.dart';

abstract class CatLocalStoreInterface {
  Future<List<Cat>> getFactHistory();
  Future<void> addFactInHistory(Cat catFact);
}
