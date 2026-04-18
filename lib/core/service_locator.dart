import 'package:get_it/get_it.dart';
import 'package:propertify/features/create_post/bloc/create_post_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/bloc/auth_bloc.dart';
import '../features/auth/repo/auth_repo.dart';
import '../features/create_post/repo/create_post_repository.dart';
import '../features/home/bloc/home_bloc.dart';
import '../features/home/repo/home_repo.dart';
import '../features/profile/repo/profile_repo.dart';
import 'api_request/api_request.dart';
import 'app_cache_service.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);
  serviceLocator.registerSingleton<AppCacheService>(AppCacheService());
  serviceLocator.registerSingleton<ApiRequest>(
    ApiRequest(serviceLocator<AppCacheService>()),
  );
}
