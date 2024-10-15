import 'dart:async';
import 'package:almanada_app/core/routes/app_pages.dart';
import 'package:almanada_app/di.dart' as di;
import 'package:almanada_app/features/auth/presentaion/manager/login_cubit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashController extends GetxController {
  String? token = "", type = "";

  @override
  void onInit() async {
    token = await _getToken();
    type = await _getType();
    print('Token ======================= Splash ? = $token');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    if (token == "") {
      Timer(const Duration(seconds: 3), () => _routeToOnboarding());
    }
    if (token != "" && type == "observer") {
      _routeToObserverHome();
    }
    if (token != "" && type == "parent") {
      _routeToHome();
    }
  }

  Future<String> _getToken() async {
    String token = "";
    await di.sl<LoginCubit>().getToken().then((value) {
      token = value;
      print('token ============= $value');
    });
    return token;
  }

  Future<String> _getType() async {
    String token = "";
    await di.sl<LoginCubit>().gettype().then((value) {
      token = value;
      print('token ============= $value');
    });
    return token;
  }

  void _routeToOnboarding() {
    Get.offNamedUntil(Routes.onboarding, (route) => false);
  }

  void _routeToHome() {
    Get.offNamedUntil(Routes.main, (route) => false);
  }

  void _routeToObserverHome() {
    Get.offNamedUntil(Routes.mainObserver, (route) => false);
  }
}
