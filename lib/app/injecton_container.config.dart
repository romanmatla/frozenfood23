// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:frozen_food/app/features/home/articles/cubit/article_cubit.dart'
    as _i9;
import 'package:frozen_food/app/features/home/tips/cubit/tips_cubit.dart'
    as _i8;
import 'package:frozen_food/app/injecton_container.dart' as _i10;
import 'package:frozen_food/app/repositories/articles_repository.dart' as _i7;
import 'package:frozen_food/app/repositories/tips_repository.dart' as _i5;
import 'package:frozen_food/data/remote_data_sources/articles_remote_data_source.dart'
    as _i6;
import 'package:frozen_food/data/remote_data_sources/tips_remote_data_source.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i3.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i4.TipsRemoteRetrofitDataSource>(
        () => _i4.TipsRemoteRetrofitDataSource(gh<_i3.Dio>()));
    gh.factory<_i5.TipsRepository>(() => _i5.TipsRepository(
        remoteDataSource: gh<_i4.TipsRemoteRetrofitDataSource>()));
    gh.factory<_i6.ArticlesRemoteRetrofitDataSource>(
        () => _i6.ArticlesRemoteRetrofitDataSource(gh<_i3.Dio>()));
    gh.factory<_i7.ArticlesRepository>(() => _i7.ArticlesRepository(
        remoteDataSource: gh<_i6.ArticlesRemoteRetrofitDataSource>()));
    gh.factory<_i8.TipsCubit>(
        () => _i8.TipsCubit(tipsRepository: gh<_i5.TipsRepository>()));
    gh.factory<_i9.ArticleCubit>(() =>
        _i9.ArticleCubit(articleRepository: gh<_i7.ArticlesRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
