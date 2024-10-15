import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentWidget extends StatelessWidget {
  final String name;
  final String studentCode;
  final String studentClass;
  final String photo;
  final Color color;

  const StudentWidget(
      {super.key,
      required this.color,
      required this.name,
      required this.studentClass,
      required this.studentCode,
      required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: paddingExt(bottom: 10, top: 10, start: 10, end: 10),
      padding: paddingExt(bottom: 10, top: 10, start: 10, end: 10),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: AppColors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Image.network(
              photo,
              height: 45.h,
              width: 45.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                name,
                style: textStyle16(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10.h,
              ),
              TextWidget(
                studentClass,
                style: textStyle14(
                    color: AppColors.grey, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                width: 10.h,
              ),
              TextWidget(
                studentCode,
                style: textStyle14(
                    color: AppColors.grey, fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
