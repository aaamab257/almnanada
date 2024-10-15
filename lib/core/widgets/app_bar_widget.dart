import 'package:almanada_app/core/index.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title = '',
    this.actions,
    this.leading,
    this.subtitle = "",
  });
  final dynamic title;
  final String subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ??
          IconButton(
            onPressed: () => Get.back(),
            tooltip: AppStrings.home.tr,
            icon: Transform.rotate(
              angle: -3.15,
              child: Image.asset(
                AppImages.back,
                height: 27.5.h,
                width: 27.5.w,
              ),
            ),
          ),
      centerTitle: true,
      title: title is String
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  title,
                  style: textStyle14(
                    fontSize: 17,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  7.5.hBox,
                  TextWidget(
                    subtitle,
                    style: textStyle10(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            )
          : title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
