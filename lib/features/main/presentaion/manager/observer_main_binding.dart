import 'package:almanada_app/features/main/presentaion/manager/observer_main_controller.dart';
import 'package:get/get.dart';

class ObserverMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ObserverMainController>(() => ObserverMainController());
  }
}
