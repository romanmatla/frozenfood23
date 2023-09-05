import 'package:dio/dio.dart';
import 'package:frozen_food/app/features/home/articles/cubit/article_cubit.dart';
import 'package:frozen_food/app/features/home/tips/cubit/tips_cubit.dart';
import 'package:frozen_food/app/repositories/articles_repository.dart';
import 'package:frozen_food/app/repositories/tips_repository.dart';
import 'package:frozen_food/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:frozen_food/data/remote_data_sources/tips_remote_data_source.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => TipsCubit(tipsRepository: getIt()));
  getIt.registerFactory(() => ArticleCubit(articleRepository: getIt()));

  // Repositories
  getIt.registerFactory(() => TipsRepository(remoteDataSource: getIt()));
  getIt.registerFactory(() => ArticlesRepository(remoteDataSource: getIt()));

  //DataSourcess
  getIt.registerFactory(() => TipsRemoteRetrofitDataSource(Dio()));
  getIt.registerFactory(() => ArticlesRemoteRetrofitDataSource(Dio()));
}
