import 'package:almanada_app/config/themes/dark_theme.dart';
import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/splash/domain/usecases/language_state.dart';
import 'package:almanada_app/features/splash/presentaion/manager/language_bloc.dart';
import 'package:almanada_app/features/splash/presentaion/manager/translations.dart';
import 'package:almanada_app/features/theme/manager/theme_cubit.dart';
import 'package:almanada_app/features/theme/manager/theme_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:almanada_app/di.dart' as di;

class AlmandaApp extends StatelessWidget {
  final ThemeMode themeMode;
  const AlmandaApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.sizeOf(context),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, _) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<LoginCubit>()..getToken()),
          BlocProvider(create: (context) => di.sl<LoginCubit>()..gettype()),
        ],
        child: BlocProvider(
            create: (context) => LanguageBloc(),
            child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                print(
                    'Local is ---------------------------- ${state.locale.languageCode}');
                return BlocProvider(
                    create: (context) => ChangeThemeBloc(),
                    child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
                        builder: (context, themeState) {
                      return GetMaterialApp(
                        useInheritedMediaQuery: true,
                        debugShowCheckedModeBanner: false,
                        translations: MyTranslations(),
                        locale: state.locale,
                        fallbackLocale: const Locale('en', 'US'),
                        supportedLocales: [
                          Locale('en', 'US'),
                          Locale('ar', 'AR'),
                        ],
                        localizationsDelegates: const [
                          // CountryLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                        ],
                        themeMode: themeMode,
                        darkTheme: darkTheme,
                        theme: themeState.changeTheme,
                        navigatorKey: Get.key,
                        title: "المناداه",
                        initialRoute: Routes.splash,
                        getPages: AppPages.routes,
                      );
                    }));
              },
            )),
      ),
    );
  }
}
