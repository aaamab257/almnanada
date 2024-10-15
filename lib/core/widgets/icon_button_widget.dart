import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    this.sizeIcon,
    this.elevation,
    this.onTap,
    this.maxminSize,
    this.backgroundColor,
    this.radius,
  });
  final dynamic icon;
  final double? sizeIcon, elevation, radius;
  final VoidCallback? onTap;
  final Size? maxminSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onTap,
      style: TextButton.styleFrom(
        elevation: elevation,
        shape: radius != null
            ? RoundedRectangleBorder(borderRadius: radius?.radius ?? 0.radius)
            : null,
        shadowColor: elevation != null ? AppColors.grey : AppColors.transparent,
        maximumSize: maxminSize ?? Size(45.w, 45.h),
        minimumSize: maxminSize ?? Size(45.w, 45.h),
        backgroundColor: backgroundColor ?? AppColors.transparent,
        padding: EdgeInsets.zero,
      ),
      padding: EdgeInsets.zero,
      icon: icon is String
          ? Image.asset(
              icon,
              height: sizeIcon?.h ?? 25.h,
              width: sizeIcon?.w ?? 25.w,
            )
          : icon,
    );
  }
}
