import 'package:almanada_app/core/network/dio_factory.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

class ServicesLocator {
  const ServicesLocator._();

  static Future<void> init() async {
    //! External
    // WidgetsFlutterBinding.ensureInitialized();
    // await GetStorage.init(EndPoints.container);

    // Get.lazyPut(() => GetStorage(EndPoints.container), fenix: true);
    // Get.lazyPut(() => LocalDBService(Get.find<GetStorage>()), fenix: true);
    //* Dio Factory (Api Client)
    Get.lazyPut<DioFactory>(() => DioFactory(), fenix: true);

    // ==================== Auth Feature ====================
  }
}
