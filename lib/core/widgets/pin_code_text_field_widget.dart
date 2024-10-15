import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class PinCodeTextFieldWidget extends StatelessWidget {
  PinCodeTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onCompleted,
  });
  final void Function(String) onChanged;
  final void Function(String) onCompleted;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      controller: controller,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      cursorColor: AppColors.black,
      textStyle: textStyle20(fontWeight: FontWeight.w600),
      onChanged: onChanged,
      onCompleted: onCompleted,
      pinTheme: PinTheme(
        borderRadius: 6.radius,
        shape: PinCodeFieldShape.box,
        fieldHeight: 50.h,
        fieldWidth: 50.h,
        inactiveBorderWidth: 0.95.w,
        activeFillColor: AppColors.white,
        inactiveColor: AppColors.primary,
        selectedColor: AppColors.primary,
        activeColor: AppColors.primary,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: false,
      appContext: context,
    );
  }
}
