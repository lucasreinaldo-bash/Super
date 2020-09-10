import 'package:get/get.dart';
import 'package:superlogicamavel/splash_screen/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    // TODO: implement dependencies
  }
}
