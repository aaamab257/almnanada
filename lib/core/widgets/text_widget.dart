import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.style,
    this.padding,
  });
  final String text;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? paddingExt(),
      child: Text(
        text.tr,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: style ?? textStyle14(),
      ),
    );
  }
}
