import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:superlogicamavel/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: GetX<LoginController>(
          builder: (_) => Text("Dia " + _loginController.dias.toString()),
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _loginController.aumentarDias();
            Navigator.pushNamed(context, "/Home");
          },
          child: Text("Aumentar Dias"),
        ),
      ),
    );
  }
}
