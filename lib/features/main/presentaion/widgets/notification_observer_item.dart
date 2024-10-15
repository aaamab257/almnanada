import 'package:almanada_app/core/index.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ObserverCardNotificationWidget extends StatelessWidget {
  String? image;
  String? title;
  String? disc;
  VoidCallback? onPressed;
  ObserverCardNotificationWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
    required this.disc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8)),
        padding: paddingExt(top: 10, bottom: 10),
        margin: paddingExt(top: 5, bottom: 5, start: 5, end: 5),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 50.w, height: 50.h, child: Image.network(image!)),
                10.wBox,
                Expanded(
                  child: TextWidget(
                    title!,
                    style: textStyle14(
                      fontSize: 16,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                10.wBox,
                Expanded(
                  child: TextWidget(
                    disc!,
                    style: textStyle14(
                      fontSize: 16,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                15.wBox,
              ],
            ),
          ],
        ));
  }
}
