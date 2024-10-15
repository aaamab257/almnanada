import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextInputWidget extends StatelessWidget {
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextStyle? textStyle, style;
  final TextStyle? hintStyle;
  final String? hintText;
  final Color prefixColor;
  final Color? fillColor, borderColor;
  final bool isPassword;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final Color suffixIconColor;
  final VoidCallback? onPressed;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? val;
  final TextInputAction? textInputAction;
  final int maxLines, minLines;
  final bool readOnly;
  final BorderRadius? borderRadius;
  final String title;
  final double? prefixSize, paddingSE;
  final bool isRequired;
  final int? maxLength;

  const TextInputWidget({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.hintStyle,
    this.isPassword = false,
    this.onChanged,
    this.validator,
    this.textStyle,
    this.prefixIcon,
    this.prefixColor = AppColors.grey,
    this.suffixIcon,
    this.onPressed,
    this.val,
    this.suffixIconColor = AppColors.grey,
    this.fillColor = AppColors.transparent,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.borderRadius,
    this.title = '',
    this.borderColor,
    this.prefixSize,
    this.isRequired = true,
    this.maxLength,
    this.style,
    this.textAlign,
    this.paddingSE,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Row(
            children: [
              TextWidget(
                title.tr,
                style: textStyle ??
                    textStyle14(
                      color: const Color(0xFF091130),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              if (isRequired) ...[
                2.5.wBox,
                Icon(
                  CupertinoIcons.staroflife_fill,
                  color: AppColors.redAccount,
                  size: 6.5.h,
                ),
              ],
            ],
          ),
          15.hBox,
        ],
        TextFormField(
          // onTapOutside: (_) => FocusScope.of(context).unfocus(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: maxLength,

          initialValue: val,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword,
          onChanged: onChanged,
          validator: validator,
          maxLines: maxLines,
          minLines: minLines,
          textInputAction: textInputAction,
          cursorColor: AppColors.black,
          textAlign: textAlign ?? TextAlign.start,
          style: style ?? textStyle14(color: AppColors.black),
          decoration: InputDecoration(
            contentPadding: paddingExt(
              start: paddingSE ?? 15,
              top: 18.5,
              end: paddingSE ?? 15,
              bottom: 18.5,
            ),
            hintText: title.tr,
            hintStyle: hintStyle ?? textStyle14(color: AppColors.textColor),
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? 6.radius,
              borderSide: BorderSide(color: borderColor ?? AppColors.textColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? 6.radius,
              borderSide: BorderSide(color: borderColor ?? AppColors.textColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? 6.radius,
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            counterText: "",
            filled: true,
            fillColor: fillColor,
            prefixIconConstraints: BoxConstraints(
              minWidth: 40.w,
              maxHeight: 35.h,
            ),
            prefixIcon: (prefixIcon != null)
                ? (prefixIcon is String)
                    ? Image.asset(
                        prefixIcon,
                        scale: prefixSize ?? 3.5,
                        color: prefixColor,
                      )
                    : prefixIcon
                : null,
            suffixIcon: (suffixIcon != null) ? suffixIcon : null,
          ),
          readOnly: readOnly,
        ),
      ],
    );
  }
}

List<BoxShadow> boxShadow = [
  BoxShadow(
    color: AppColors.grey.withOpacity(0.15),
    blurRadius: 10,
    offset: const Offset(-4, 2.5),
  ),
];
