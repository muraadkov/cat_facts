import 'package:cat_trivia/domain/object/cat_response.dart';
import 'package:cat_trivia/presentation/model/cat.dart';

abstract class CatRepositoryInterface {
  Future<CatResponse?> fetchCatFact();
  Future<List<Cat>> getFactHistory();
  Future<void> addCatFact(Cat catFact);
}
