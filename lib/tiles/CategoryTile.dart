import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:superlogicamavel/models/baseDadosProdutos.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  String nomeEmpresa, imagemEmpresa, cidadeEstado, endereco, telefone;
  double latitude, longitude;
  List<dynamic> personagens;

  CategoryTile(this.personagens);
  List<BaseDadosProdutos> baseProdutos = List<BaseDadosProdutos>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 255, 255, 190),
                  Color.fromARGB(255, 180, 255, 255)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              ListTile(
                title: Text(
                  personagens[1]["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () async {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

Future<dynamic> refreshDataDio() async {
  double valor;
  var dataStr = jsonEncode({
    "command": "get_products",
  });
  var url = "https://nuage.net.br/lucas/controller.php?data=" + dataStr;

  Response response = await Dio().get(url);

//    print(response.data);

  List<BaseDadosProdutos> baseProdutos = List<BaseDadosProdutos>();

  for (Map<String, dynamic> item in response.data) {
    baseProdutos.add(BaseDadosProdutos.fromJson(item));
//      print(item);

  }
  List<BaseDadosProdutos> _searchResult = [];

  List<BaseDadosProdutos> _userDetails = [];

  return baseProdutos;
}
