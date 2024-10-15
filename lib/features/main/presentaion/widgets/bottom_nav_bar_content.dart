import 'package:almanada_app/features/main/presentaion/manager/main_controller.dart';
import 'package:almanada_app/util/app_images.dart';
import 'package:almanada_app/util/app_strings.dart';
import 'package:almanada_app/util/colors.dart';
import 'package:almanada_app/util/extension.dart';
import 'package:almanada_app/util/styles/text_style_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavBarContent extends StatelessWidget {
  const BottomNavBarContent({required this.controller});
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.state.currentIndex,
      onTap: (index) => controller.onChangePage(index: index),
      items: [
        _bottomNavBarItem(label: AppStrings.home, icon: AppImages.home),
        _bottomNavBarItem(
            label: AppStrings.notifications,
            icon: AppImages.notifications_icon),
        _bottomNavBarItem(label: AppStrings.previous, icon: AppImages.history),
        _bottomNavBarItem(label: AppStrings.profile, icon: AppImages.profile),
      ],
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          textStyle12(color: AppColors.primary, fontWeight: FontWeight.w600),
      unselectedLabelStyle: textStyle12(),
      selectedItemColor: AppColors.primary,
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
    );
  }

  BottomNavigationBarItem _bottomNavBarItem({
    required String label,
    required dynamic icon,
    double? height,
    double? width,
  }) {
    return BottomNavigationBarItem(
      label: label.tr,
      icon: icon is String
          ? Padding(
              padding: paddingExt(bottom: 2.5),
              child: Image.asset(
                icon,
                height: height?.h ?? 19.h,
                width: width?.w ?? 19.w,
                color: AppColors.black,
                fit: BoxFit.cover,
              ),
            )
          : icon,
      activeIcon: icon is String
          ? Padding(
              padding: paddingExt(bottom: 2.5),
              child: Image.asset(
                icon,
                height: height?.h ?? 19.h,
                width: width?.w ?? 19.w,
                color: AppColors.black,
                fit: BoxFit.cover,
              ),
            )
          : icon,
    );
  }
}
