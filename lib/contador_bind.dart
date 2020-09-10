import 'package:get/get.dart';
import 'package:superlogicamavel/contador_controller.dart';

class ContadorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContadorController>(() => ContadorController());
    // TODO: implement dependencies
  }
}
