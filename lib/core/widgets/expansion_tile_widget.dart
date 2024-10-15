import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.isTrailing = true,
  });

  final String title, subtitle;
  final bool isTrailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title,
          style: textStyle14(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        isTrailing ? 2.5.hBox : 15.hBox,
        ExpansionTile(
          title: TextWidget(
            subtitle,
            style: textStyle14(
              color: AppColors.black.withOpacity(0.6),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: isTrailing ? BorderRadius.zero : 6.radius,
            side: isTrailing ? BorderSide.none : const BorderSide(),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: isTrailing ? BorderRadius.zero : 6.radius,
            side: isTrailing ? BorderSide.none : const BorderSide(),
          ),
          tilePadding:
              isTrailing ? EdgeInsets.zero : paddingExt(start: 15, end: 15),
          trailing: isTrailing
              ? Image.asset(
                  AppImages.downButton,
                  height: 17.5.h,
                  width: 17.5.w,
                )
              : null,
        ),
        if (isTrailing) const Divider(height: 0.0),
        15.hBox,
      ],
    );
  }
}
