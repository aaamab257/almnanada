import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/pin_code_text_field_widget.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:almanada_app/features/auth/presentaion/pages/change_password.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:almanada_app/di.dart' as di;

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: paddingExt(start: 20, top: 60, end: 20, bottom: 20),
          children: [
            Image.asset(
              AppImages.sms,
              height: 90.h,
              width: 90.w,
            ),
            40.hBox,
            TextWidget(
              AppStrings.verificationCode,
              textAlign: TextAlign.center,
              style: textStyle24(
                fontWeight: FontWeight.w600,
              ),
            ),
            10.hBox,
            TextWidget(
              AppStrings.verificationCodeSubtitle,
              textAlign: TextAlign.center,
              style: textStyle16(
                height: 1.4,
                fontWeight: FontWeight.w600,
              ),
            ),
            40.hBox,
            Padding(
              padding: paddingExt(start: 60, end: 60),
              child: PinCodeTextFieldWidget(
                onChanged: (_) {},
                onCompleted: (_) {},
                controller: textEditingController,
              ),
            ),
            40.hBox,
            MainButtonWidget(
              title: AppStrings.send,
              backgroundColor: AppColors.primary,
              onPressed: () {
                print('Code ============= > ${textEditingController.text}');
                di
                    .sl<LoginCubit>()
                    .verifiyCode(textEditingController.text)
                    .then((onValue) {
                  if (onValue.status == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(
                                code: textEditingController.text,
                              )),
                    );
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
