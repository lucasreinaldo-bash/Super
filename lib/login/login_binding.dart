import 'package:get/get.dart';
import 'package:superlogicamavel/login/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    // TODO: implement dependencies
  }
}
