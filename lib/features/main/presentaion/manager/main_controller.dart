import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/features/main/presentaion/manager/main_state.dart';
import 'package:almanada_app/features/main/presentaion/pages/home_page.dart';
import 'package:almanada_app/features/main/presentaion/pages/notification_page.dart';
import 'package:almanada_app/features/profile/presentaion/pages/history_screen.dart';
import 'package:almanada_app/features/profile/presentaion/pages/profile_page.dart';
import 'package:almanada_app/util/app_strings.dart';

import 'package:get/get.dart';

class MainController extends GetxController {
  final Rx<MainState> _state = MainState(
    pages: const [
      HomePage(),
      NotificationPage(),
      HistoryScreen(),
      ProfilePage(),
      // NotificationPage(),
      // AddRealEstatePage(),
      // ChatsPage(),
      // ProfilePage(),
    ],
    titles: const [
      "",
      AppStrings.notifications,
      AppStrings.addRealEstate,
      // AppStrings.messages,
      // AppStrings.profilePersonly,
    ],
    content: const [
      AppStrings.home,
      AppStrings.profilePersonly,
      AppStrings.myAuctions,
      AppStrings.commissionConversion,
      AppStrings.aboutApp,
      AppStrings.howWeWork,
      AppStrings.privacyPolicy,
      AppStrings.titleTAndC,
      AppStrings.watchlist,
      AppStrings.contactUs,
    ],
    onTaps: [
      () {},
      () {},
      () => Get.toNamed(Routes.myAuctions),
      () => Get.toNamed(Routes.commissionConversion),
      () => Get.toNamed(Routes.aboutApp),
      () => Get.toNamed(Routes.howWeWork),
      () {},
      () => Get.toNamed(Routes.termsAndConditions),
      () => Get.toNamed(Routes.watchlist),
      () => Get.toNamed(Routes.contactUs),
    ],
  ).obs;

  MainState get state => _state.value;

  void _update(MainState state) {
    _state.value = state;
    update();
  }

  void onChangePage({required int index}) {
    _update(_state.value.copyWith(currentIndex: index));
  }
}
