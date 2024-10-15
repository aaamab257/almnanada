import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_interface.dart';
import 'package:get/get_instance/src/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

extension NumExtension on num {
  SizedBox get hBox => SizedBox(height: toDouble().h);
  SizedBox get wBox => SizedBox(width: toDouble().w);
  BorderRadius get radius => BorderRadius.circular(toDouble().r);
  Radius get radiusCircular => Radius.circular(toDouble().r);
}

extension GetInterfaceExtension on GetInterface {
  bool isTNotRegistered<T extends GetxController>() {
    return !GetInstance().isRegistered<T>();
  }
}

extension TextEditingControllerExtension on TextEditingController {
  TextEditingController copyWith({String? text}) {
    return TextEditingController(text: text ?? this.text);
  }
}

extension TextThemeExtension on BuildContext {
  TextStyle get body14 => Theme.of(this).textTheme.bodyMedium!; //! 14
  TextStyle get body12 => Theme.of(this).textTheme.bodySmall!; //! 12
  TextStyle get body16 => Theme.of(this).textTheme.bodyLarge!; //! 16

  TextStyle get head24 => Theme.of(this).textTheme.headlineSmall!; //! 24
}

extension FontExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  // TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  // TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  // TextStyle get overline => copyWith(decoration: TextDecoration.overline);
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle colorExt(Color color) => copyWith(color: color);
}

extension DimensionExtension on BuildContext {
  double get dHeight => MediaQuery.of(this).size.height;
  double get dWidth => MediaQuery.of(this).size.width;
}

paddingExt({
  double end = 0,
  double top = 0,
  double start = 0,
  double bottom = 0,
}) {
  return EdgeInsetsDirectional.only(
    end: end.w,
    top: top.h,
    start: start.w,
    bottom: bottom.h,
  );
}
