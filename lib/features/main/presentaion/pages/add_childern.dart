import 'package:almanada_app/core/widgets/custom_drop_down.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_input_widget.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddChildrenPage extends StatefulWidget {
  const AddChildrenPage({super.key});

  @override
  State<AddChildrenPage> createState() => _AddChildrenPageState();
}

class _AddChildrenPageState extends State<AddChildrenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: paddingExt(start: 25, top: 50, end: 25, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Image.asset(
                AppImages.boyAvatar,
                height: context.dHeight * 0.15,
                width: context.dWidth * 0.4,
                fit: BoxFit.fill,
              ),
            ),
            20.hBox,
            TextWidget(
              AppStrings.add,
              style: textStyle18(fontWeight: FontWeight.w600),
            ),
            30.hBox,
            TextInputWidget(
              title: AppStrings.name,
              prefixIcon: AppImages.profile,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            15.hBox,
            TextInputWidget(
              title: "كود الطالب",
              prefixIcon: AppImages.profile,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            15.hBox,
            TextWidget(
              "الصف",
              style: textStyle14(
                color: const Color(0xFF091130),
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: paddingExt(bottom: 5, top: 15, start: 0, end: 0),
              padding: paddingExt(bottom: 10, top: 10, start: 10, end: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Theme.of(context).cardColor,
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 0.3.h)),
              child: CustomDropdown(
                dropdownButtonStyle: DropdownButtonStyle(
                  height: 40,
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 15.h,
                  ),
                  primaryColor: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                dropdownStyle: DropdownStyle(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(8.r),
                  padding: EdgeInsets.all(35.dm),
                ),
                items: [],
                child: TextWidget(
                  "الصف",
                  style: textStyle16(),
                ),
              ),
            ),
            35.hBox,
            MainButtonWidget(title: AppStrings.add, onPressed: () {}),
          ],
        ),
      )),
    );
  }
}
