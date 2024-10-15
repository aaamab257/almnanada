import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardRealEstateTypeWidget extends StatelessWidget {
  const CardRealEstateTypeWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String icon, title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: 13.5.radius,
      child: Container(
        height: 73.5.h,
        width: 73.5.w,
        padding: paddingExt(start: 10, top: 7.5, end: 10, bottom: 7.5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC6C81D) : AppColors.transparent,
          borderRadius: 13.5.radius,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: 40.h,
              width: 40.w,
              color: isSelected ? AppColors.white : AppColors.textColor,
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                title,
                maxLines: 1,
                style: textStyle14(
                  fontSize: 15,
                  color: isSelected ? AppColors.white : AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
