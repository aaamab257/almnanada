import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';

class CheckBoxListTileWidget extends StatelessWidget {
  const CheckBoxListTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.contentPadding,
  });
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: CheckboxListTile(
        dense: true,
        contentPadding: contentPadding ?? paddingExt(start: 20, end: 20),
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        onChanged: onChanged,
        title: TextWidget(
          title,
          style: textStyle16(fontWeight: FontWeight.w600),
        ),
        activeColor: AppColors.primary,
      ),
    );
  }
}
