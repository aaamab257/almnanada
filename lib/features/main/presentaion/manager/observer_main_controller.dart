import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/features/main/presentaion/manager/observer_main_state.dart';

import 'package:almanada_app/features/main/presentaion/pages/observer_notification_page.dart';
import 'package:almanada_app/features/main/presentaion/pages/observer_screen.dart';
import 'package:almanada_app/features/profile/presentaion/pages/history_screen.dart';
import 'package:almanada_app/features/profile/presentaion/pages/profile_page.dart';
import 'package:almanada_app/util/app_strings.dart';

import 'package:get/get.dart';

class ObserverMainController extends GetxController {
  final Rx<ObserverMainState> _state = ObserverMainState(
    pages: const [
      ObserverScreen(),
      ObserverNotificationPage(),
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

  ObserverMainState get state => _state.value;

  void _update(ObserverMainState state) {
    _state.value = state;
    update();
  }

  void onChangePage({required int index}) {
    _update(_state.value.copyWith(currentIndex: index));
  }
}
