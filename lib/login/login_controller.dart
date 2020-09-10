import 'package:get/get.dart';

class LoginController extends GetxController {
  final _dias = 0.obs;

  get dias => this._dias.value;
  set dias(value) => this._dias.value = value;

  aumentarDias() {
    this.dias++;
  }

  diminuirDias() {
    this.dias--;
  }
}
