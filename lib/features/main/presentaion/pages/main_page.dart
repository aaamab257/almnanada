import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/core/widgets/app_bar_widget.dart';
import 'package:almanada_app/features/main/presentaion/manager/main_controller.dart';
import 'package:almanada_app/features/main/presentaion/widgets/bottom_nav_bar_content.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBarWidget(
            leading: Padding(
              padding: paddingExt(start: 15, end: 15),
              child: Container(
                  width: 45.w,
                  height: 45.h,
                  child: Image.asset(
                    AppImages.horizontalLogo,
                    color: AppColors.white,
                    scale: 5,
                  )),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.phone,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Get.toNamed(Routes.contactUs);
                },
              ),
            ],
          ),
          extendBodyBehindAppBar:
              controller.state.currentIndex == 2 ? true : false,
          body: controller.state.pages[controller.state.currentIndex],
          bottomNavigationBar: SafeArea(
            child: BottomNavBarContent(controller: controller),
          ),
        );
      },
    );
  }
}
