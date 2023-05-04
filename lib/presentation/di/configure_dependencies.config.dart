// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repository/cat_repository.dart' as _i5;
import '../../data/repository/store/cloud/cat_cloud_store.dart' as _i6;
import '../../data/repository/store/local/cat_local_store.dart' as _i4;
import '../../domain/interactor/cat_interactor.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final dio = Dio();
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CatInteractor>(() => _i3.CatInteractor());
  gh.lazySingleton<_i4.CatLocalStore>(() => _i4.CatLocalStore());
  gh.lazySingleton<_i5.CatRepository>(() => _i5.CatRepository(
        get<_i6.CatCloudStore>(),
        get<_i4.CatLocalStore>(),
      ));
  gh.lazySingleton<_i6.CatCloudStore>(() => _i6.CatCloudStore(dio));
  return get;
}
