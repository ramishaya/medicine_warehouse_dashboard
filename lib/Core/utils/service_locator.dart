import 'package:dashboard/Featuers/LOGIN/data/repos/login_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Featuers/HOME/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));
}
