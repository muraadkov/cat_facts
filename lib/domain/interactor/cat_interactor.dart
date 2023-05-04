import 'package:cat_trivia/data/repository/cat_repository.dart';
import 'package:cat_trivia/data/repository/interface/cat_repository_interface.dart';
import 'package:cat_trivia/domain/mapper/map_cat_response_to_cat.dart';
import 'package:cat_trivia/presentation/di/configure_dependencies.dart';
import 'package:cat_trivia/presentation/model/cat.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CatInteractor {
  final CatRepositoryInterface _catRepository = getIt<CatRepository>();

  Future<void> addCatFact(Cat catFact) async {
    await _catRepository.addCatFact(catFact);
  }

  Future<Cat?> fetchCatFact() async {
    final catResponse = await _catRepository.fetchCatFact();
    if (catResponse != null) {
      final cat = MapCatResponseToCat.mapCatResponse(catResponse);
      return cat;
    }
    return null;
  }

  Future<List<Cat>> getFactHistory() async {
    return await _catRepository.getFactHistory();
  }
}
