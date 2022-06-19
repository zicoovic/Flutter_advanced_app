import 'package:dio/dio.dart';
import '/app/app_prefs.dart';
import '/data/data_source/remote_data_source.dart';
import '/data/network/app_api.dart';
import '/data/network/dio_factory.dart';
import '/data/network/network_info.dart';
import '/data/repositroy/repositroy_impl.dart';
import '/data/usecase/login_use_case.dart';
import '/domain/repositroy/repository.dart';
import '/persentation/login/viewmodel/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module , it's a module where we put all generic dependencies

  // shared prefs instance
  final sharedprefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedprefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();

  // app service client

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repositry>(
      () => RepositroyImpl(instance(), instance()));
}

intitLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
