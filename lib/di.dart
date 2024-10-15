import 'package:almanada_app/core/api/api_consumer.dart';
import 'package:almanada_app/core/api/app_interceptors.dart';
import 'package:almanada_app/core/api/dio_consumer.dart';
import 'package:almanada_app/core/api/network_checker.dart';
import 'package:almanada_app/core/shared_pref/app_prefs.dart';
import 'package:almanada_app/features/auth/data/data_source/login_cash_data.dart';
import 'package:almanada_app/features/auth/data/data_source/login_remote_data_source.dart';
import 'package:almanada_app/features/auth/data/repository/login_repo_impl.dart';
import 'package:almanada_app/features/auth/domain/repo/login_repo.dart';
import 'package:almanada_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/profile/data/data_source/remote_data_source.dart';
import 'package:almanada_app/features/profile/data/repository/history_repo_impl.dart';
import 'package:almanada_app/features/profile/domain/repo/history_repo.dart';
import 'package:almanada_app/features/profile/domain/usecase/history_usecase.dart';
import 'package:almanada_app/features/profile/presentaion/manager/history_cubit.dart';
import 'package:almanada_app/features/splash/data/repository/lang_repository_impl.dart';
import 'package:almanada_app/features/splash/data/source/locale_lang/lang_locale_data_source.dart';
import 'package:almanada_app/features/splash/domain/repository/local/lang_repository.dart';
import 'package:almanada_app/features/splash/domain/usecases/local_use_case/change_local_lang.dart';
import 'package:almanada_app/features/splash/domain/usecases/local_use_case/get_saved_lang.dart';
import 'package:almanada_app/features/splash/presentaion/localization/local_bloc/local_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));

  sl.registerFactory<LoginCubit>(() => LoginCubit(
        loginUseCase: sl<LoginUseCase>(),
      ));

  sl.registerFactory<HistoryCubit>(() => HistoryCubit(
        historyUsecase: sl<HistoryUsecase>(),
      ));

  // sl.registerFactory<ProfileCubit>(() => ProfileCubit(
  //       profileUseCase: sl<ProfileUseCase>(),
  //     ));

  // //use-cases

  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));

  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepo: sl()));
  sl.registerLazySingleton<HistoryUsecase>(
      () => HistoryUsecase(historyRepo: sl()));

  // sl.registerLazySingleton<ProfileUseCase>(
  //     () => ProfileUseCase(profileRepo: sl()));

  // //repositories
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));

  sl.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(
      networkInfo: sl(),
      loginRemoteDataSource: sl(),
      loginCasheDataSource: sl<LoginCasheDataSource>()));

  sl.registerLazySingleton<HistoryRepo>(() => HistoryRepoImpl(
        networkInfo: sl(),
        historyRemoteDataSource: sl(),
      ));

  // sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
  //       networkInfo: sl(),
  //       profileRemoteDataSource: sl(),
  //     ));

  //DataSource
  sl.registerLazySingleton<LangLocalDataSource>(() =>
      LangLocalDataSourceImpl(sharedPreferences: sl<SharedPreferences>()));

  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<HistoryRemoteDataSource>(
      () => HistoryRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LoginCasheDataSource>(() =>
      LoginCasheDataSourceImpl(sharedPreferences: sl<SharedPreferences>()));

  // sl.registerLazySingleton<ProfileRemoteDataSource>(
  //     () => ProfileRemoteDataSourceImpl(apiConsumer: sl()));

  // //extract
  sl.registerLazySingleton<AppPreferences>(
      () => AppPreferences(sl<SharedPreferences>()));
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
