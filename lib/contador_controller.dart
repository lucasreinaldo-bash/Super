import 'package:get/get.dart';

class ContadorController extends GetxController {
  final _contador = 0.obs;

  get contador => this._contador.value;
  set contador(value) => this._contador.value = value;

  increment() {
    this.contador++;
  }

  dencrement() {
    this.contador--;
  }
}
