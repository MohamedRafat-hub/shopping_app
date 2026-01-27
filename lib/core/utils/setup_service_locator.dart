import 'package:cartzy_app/features/product/data/repos/category_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;   // Singleton

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt.get<Dio>()));

  getIt.registerLazySingleton<HomeRepoImpl>(
          () => HomeRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerLazySingleton<CategoryRepoImpl>(()=> CategoryRepoImpl(getIt.get<ApiService>()));
}