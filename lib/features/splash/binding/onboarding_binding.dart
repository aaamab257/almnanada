import 'package:almanada_app/features/splash/presentaion/manager/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<SplashController>(
        () => SplashController(),
        fenix: true,
      );
}
