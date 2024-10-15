import 'package:almanada_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle _globalTextStyle({
  double? letterSpacing,
  double? size,
  double? height,
  TextDecoration? decoration,
  Color? color = AppColors.black,
  Color? decorationColor,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      fontSize: (size ?? 14).sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: (height ?? 1.2).h,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor ?? color,
      fontFamily: fontFamily ?? 'Cairo',
    );
TextStyle textStyle24({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = AppColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
  Color? decorationColor,
}) =>
    _globalTextStyle(
      size: 24,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      fontFamily: fontFamily ?? 'Cairo',
    );

TextStyle textStyle20({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = AppColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
  Color? decorationColor,
}) =>
    _globalTextStyle(
      size: 20,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      fontFamily: fontFamily ?? 'Cairo',
    );

TextStyle textStyle18({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = AppColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
  Color? decorationColor,
}) =>
    _globalTextStyle(
      size: 18,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      fontFamily: fontFamily ?? 'Cairo',
    );

TextStyle textStyle16({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = AppColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
  Color? decorationColor,
}) =>
    _globalTextStyle(
      size: 16,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      fontFamily: fontFamily ?? 'Cairo',
    );

TextStyle textStyle14({
  double? letterSpacing,
  double? height,
  String? fontFamily,
  TextDecoration? decoration,
  Color color = AppColors.black,
  double? wordSpacing,
  double? fontSize,
  FontWeight? fontWeight,
  Color? decorationColor,
}) =>
    _globalTextStyle(
      size: fontSize,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      fontFamily: fontFamily ?? 'Cairo',
    );

TextStyle textStyle12({
  double? letterSpacing,
  double? height,
  String? fontFamily,
  TextDecoration? decoration,
  Color? color,
  double? wordSpacing,
  FontWeight? fontWeight,
  Color? decorationColor,
}) =>
    _globalTextStyle(
      size: 12,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      fontFamily: fontFamily ?? 'Cairo',
    );

TextStyle textStyle10({
  double? letterSpacing,
  double? height,
  String? fontFamily,
  TextDecoration? decoration,
  Color color = AppColors.black,
  double? wordSpacing,
  FontWeight? fontWeight,
  Color? decorationColor,
}) =>
    _globalTextStyle(
      size: 10,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
      color: color,
      wordSpacing: wordSpacing,
      decorationColor: decorationColor,
      fontFamily: fontFamily ?? 'Cairo',
    );
