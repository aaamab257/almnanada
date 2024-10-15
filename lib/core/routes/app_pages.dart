import 'package:almanada_app/features/auth/presentaion/pages/forget_password.dart';
import 'package:almanada_app/features/auth/presentaion/pages/login_page.dart';
import 'package:almanada_app/features/auth/presentaion/pages/register_page.dart';

import 'package:almanada_app/features/auth/presentaion/pages/verification_code.dart';
import 'package:almanada_app/features/main/presentaion/manager/main_binding.dart';
import 'package:almanada_app/features/main/presentaion/manager/observer_main_binding.dart';
import 'package:almanada_app/features/main/presentaion/pages/about_us.dart';
import 'package:almanada_app/features/main/presentaion/pages/change_language.dart';
import 'package:almanada_app/features/main/presentaion/pages/contact_us_page.dart';
import 'package:almanada_app/features/main/presentaion/pages/main_page.dart';
import 'package:almanada_app/features/main/presentaion/pages/map_page.dart';
import 'package:almanada_app/features/main/presentaion/pages/observer_main_screen.dart';
import 'package:almanada_app/features/main/presentaion/pages/observer_screen.dart';
import 'package:almanada_app/features/profile/presentaion/pages/edit_profile_screen.dart';
import 'package:almanada_app/features/profile/presentaion/pages/history_screen.dart';
import 'package:almanada_app/features/splash/binding/onboarding_binding.dart';
import 'package:almanada_app/features/splash/binding/splash_binding.dart';
import 'package:almanada_app/features/splash/presentaion/pages/onBoarding_screen.dart';
import 'package:almanada_app/features/splash/presentaion/pages/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'routes.dart';

class AppPages {
  const AppPages._();

  static final List<GetPage> routes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.onboarding,
        page: () => const OnboardingScreen(),
        binding: OnboardingBinding()),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgotPassword(),
    ),
    GetPage(
      name: Routes.observer,
      page: () => const ObserverScreen(),
    ),
    GetPage(
      name: Routes.updateProfile,
      page: () => const UpdateProfileScreen(),
    ),
    GetPage(
      name: Routes.history,
      page: () => const HistoryScreen(),
    ),
    GetPage(
      name: Routes.aboutApp,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: Routes.contactUs,
      page: () => const ContactUsPage(),
    ),
    GetPage(
      name: Routes.changeLang,
      page: () => const ChangeLanguageScreen(),
    ),
    // GetPage(
    //   name: Routes.register,
    //   page: () => const RegisterPage(),
    // ),
    GetPage(
      name: Routes.map,
      page: () => const MapPage(),
    ),
    GetPage(
      name: Routes.verifyCode,
      page: () => const VerifyCodePage(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      bindings: [
        MainBinding(),
        // HomeBinding(),
        // AddRealEstateBinding(),
      ],
    ),
    GetPage(
      name: Routes.mainObserver,
      page: () => const ObserverMainPage(),
      bindings: [
        ObserverMainBinding(),
        // HomeBinding(),
        // AddRealEstateBinding(),
      ],
    ),
  ];
}

class Arguments {
  final String deviceToken;

  Arguments(
    this.deviceToken,
  );
}
