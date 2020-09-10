import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superlogicamavel/contador_controller.dart';

import 'models/baseDadosProdutos.dart';

class ContadorPage extends GetView<ContadorController> {
  var dataStr = jsonEncode({
    "command": "get_products",
  });
  final ContadorController controller = Get.put(ContadorController());

  List<BaseDadosProdutos> baseProdutos;
  Response response;
  @override
  Widget build(BuildContext context) {
    consumirApi();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.increment();
        },
      ),
      appBar: AppBar(
        title: Text("Deus no comando"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: GetX<ContadorController>(
                builder: (_) => Text(
                  controller.contador.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ]),
    );
  }

  consumirApi() async {
    var url = "https://nuage.net.br/lucas/controller.php?data=" + dataStr;

    response = await Dio()
        .get(url)
        .whenComplete(() => print(response.data.toString()));

    print(response.data);

    baseProdutos = List<BaseDadosProdutos>();

    for (Map<String, dynamic> item in response.data) {
      baseProdutos.add(BaseDadosProdutos.fromJson(item));
//      print(item);

    }
  }
}
