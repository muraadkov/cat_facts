import 'package:cat_trivia/domain/object/cat_response.dart';

abstract class CatCloudStoreInterface {
  Future<CatResponse?> getCatFact();
}
