import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/core/networking/api_service.dart';
import 'package:flutter_advanced_course/core/networking/dio_factory.dart';
import 'package:flutter_advanced_course/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced_course/features/login/logic/cubit/login_cubit.dart';

import 'package:get_it/get_it.dart';

import '../../features/signup/data/repos/sign_up_repo.dart';
import '../../features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
