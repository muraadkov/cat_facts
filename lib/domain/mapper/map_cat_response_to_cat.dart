import 'package:cat_trivia/domain/object/cat_response.dart';
import 'package:cat_trivia/presentation/model/cat.dart';

class MapCatResponseToCat {
  static Cat mapCatResponse(CatResponse catResponse) {
    final cat = Cat(fact: catResponse.fact, length: catResponse.length);
    return cat;
  }
}
