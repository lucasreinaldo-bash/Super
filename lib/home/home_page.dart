import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:superlogicamavel/home/home_controller.dart';
import 'package:superlogicamavel/home/screen_menu.dart';
import 'package:superlogicamavel/models/baseDadosProdutos.dart';

class HomePage extends GetView<HomeController> {
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: RaisedButton(
            child: Text("Teste"),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScreenMenu()));
            },
          ),
        )
      ],
    ));
  }

  consumirApi() async {
    var dataStr = jsonEncode({
      "command": "get_products",
    });
    List<BaseDadosProdutos> baseProdutos;
    Response response;

    String url =
        "https://gateway.marvel.com:443/v1/public/characters?apikey=38ae34fe8f0260203d2956b8b23f1150";

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
