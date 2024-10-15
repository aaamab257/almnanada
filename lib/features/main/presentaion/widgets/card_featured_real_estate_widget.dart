import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/main/data/models/students_model.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class StudentCardWidget extends StatelessWidget {
  StudentDetails list;
  StudentCardWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 100.w,
      margin: paddingExt(end: 10),
      padding: paddingExt(start: 5, top: 5, end: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: 13.5.radius,
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: const [
                // BoxShadow(
                //   offset: Offset(0, 4),
                //   blurStyle: BlurStyle.solid,
                //   color: Color.fromRGBO(0, 0, 0, 0.25),
                // )
              ],
              borderRadius: 13.5.radius,
            ),
            child: Image.asset(
              AppImages.boyAvatar,
              height: 70.h,
              width: 80.w,
            ),
          ),
          5.hBox,
          TextWidget(
            list.name!,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textStyle14(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
