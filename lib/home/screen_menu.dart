import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:superlogicamavel/models/baseDadosProdutos.dart';
import 'package:superlogicamavel/tiles/CategoryTile.dart';

class ScreenMenu extends StatefulWidget {
  @override
  _ScreenMenuState createState() => _ScreenMenuState();
}

class _ScreenMenuState extends State<ScreenMenu> {
  var url =
      "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=38ae34fe8f0260203d2956b8b23f1150&hash=6dc2f893217bb0fa170d2746b1233d34";
  List<dynamic> personagens;
  @override
  void initState() {
    // TODO: implement initState
    consumirApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    consumirApi();

    return Scaffold(
      appBar: AppBar(
        title: Text(personagens[1]["name"]),
      ),
      body: Column(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: personagens.map((e) => Text("adasdsa")).toList(),
          )
        ],
      ),
    );
  }

  consumirApi() async {
    var result = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    Map<String, dynamic> responseMap = json.decode(result.body);
    Map<String, dynamic> data = responseMap["data"];

    personagens = data["results"];

    print(personagens[10]["name"]);

    List<BaseDadosProdutos> baseProdutos = List<BaseDadosProdutos>();
  }
}
