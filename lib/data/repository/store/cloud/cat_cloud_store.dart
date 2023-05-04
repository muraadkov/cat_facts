import 'package:cat_trivia/data/consts/api_constants.dart';
import 'package:cat_trivia/data/repository/store/cloud/cat_cloud_store_interface.dart';
import 'package:cat_trivia/domain/object/cat_response.dart';
import 'package:cat_trivia/presentation/model/cat.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_cloud_store.g.dart';

@RestApi(baseUrl: ApiConstants.catBaseUrl)
abstract class CatCloudStore implements CatCloudStoreInterface {
  factory CatCloudStore(Dio dio) = _CatCloudStore;

  @override
  @GET(ApiConstants.catFactPath)
  Future<CatResponse?> getCatFact();
}
