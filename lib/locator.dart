import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';

import 'core/viewmodels/comments_model.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/login_model.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}