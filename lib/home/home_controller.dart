import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:superlogicamavel/models/baseDadosProdutos.dart';

class HomeController extends GetxController {
  var dataStr = jsonEncode({
    "command": "get_products",
  });
  List<BaseDadosProdutos> baseProdutos;
  Response response;
  consumirApi() async {
    var url = "https://nuage.net.br/lucas/controller.php?data=" + dataStr;

    response = await Dio()
        .get(url)
        .whenComplete(() => print(response.data.toString()));

//    print(response.data);

    baseProdutos = List<BaseDadosProdutos>();

    for (Map<String, dynamic> item in response.data) {
      baseProdutos.add(BaseDadosProdutos.fromJson(item));
//      print(item);

    }
  }
}
