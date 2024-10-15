import 'package:almanada_app/config/localization/app_localization.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      contentPadding: paddingExt(start: 15, top: 5, end: 10, bottom: 5),
      title: TextWidget(
        title.tr,
        style: textStyle18(
          fontWeight: FontWeight.w600,
          color: AppColors.textColor,
        ),
      ),
      trailing: IconButton.filled(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        style: TextButton.styleFrom(
          maximumSize: Size(32.5.w, 32.5.h),
          minimumSize: Size(32.5.w, 32.5.h),
          backgroundColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: 4.radius,
            side: const BorderSide(color: AppColors.primary, width: 2.0),
          ),
        ),
        icon: Icon(
          Icons.arrow_forward,
          size: 22.h,
        ),
      ),
    );
  }
}
