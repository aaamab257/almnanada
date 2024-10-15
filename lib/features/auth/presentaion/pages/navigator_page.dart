import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/widgets/main_button_widget.dart';
import 'package:almanada_app/core/widgets/text_widget.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: paddingExt(start: 25, top: 80, end: 25, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.hBox,
              TextWidget(
                AppStrings.accType,
                style: textStyle18(fontWeight: FontWeight.w600),
              ),
              30.hBox,
              MainButtonWidget(
                title: AppStrings.parent,
                onPressed: () {
                  Get.toNamed(Routes.register);
                },
              ),
              15.hBox,
              MainButtonWidget(
                title: AppStrings.supervisor,
                onPressed: () {
                  Get.toNamed(Routes.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
