import 'package:almanada_app/core/index.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HistoryItem extends StatelessWidget {
  String? floor;
  String? observer;
  String? room;
  String? callTime;
  String? outTime;
  String? waitingTime;
  String? pickupTime;
  String? studentName;
  String? date;
  HistoryItem({
    super.key,
    required this.callTime,
    this.observer,
    required this.floor,
    required this.date,
    required this.outTime,
    required this.waitingTime,
    required this.room,
    required this.pickupTime,
    required this.studentName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: paddingExt(bottom: 10, top: 10, start: 10, end: 10),
      padding: paddingExt(bottom: 10, top: 10, start: 10, end: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              TextWidget(
                AppStrings.studentName,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                studentName!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.floors,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                floor!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.supervisor,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                observer!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.rooms,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                room!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.callTime,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                callTime!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.StudentOutat,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                outTime!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.pickup,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                pickupTime!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.waitingTime,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                waitingTime!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
          8.hBox,
          Row(
            children: [
              TextWidget(
                AppStrings.date,
                style: textStyle16(color: AppColors.primary),
              ),
              const Spacer(),
              TextWidget(
                date!,
                style: textStyle14(color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
