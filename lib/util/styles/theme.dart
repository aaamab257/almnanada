import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData get lightTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        secondary: AppColors.primary.withOpacity(0.5),
      ),
      fontFamily: 'Segoe',
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        toolbarHeight: 70.h,
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: 20.radiusCircular,
            bottomRight: 20.radiusCircular,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.black,
        thickness: 1.0,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        elevation: 0.0,
        color: AppColors.white,
        surfaceTintColor: AppColors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0.0,
        backgroundColor: AppColors.primary,
        shape: CircleBorder(),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        },
      ),
    );
