import 'package:get/get.dart';
import 'package:superlogicamavel/contador_controller.dart';

class HomeBindigs extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContadorController>(() => ContadorController());
    // TODO: implement dependencies
  }
}
