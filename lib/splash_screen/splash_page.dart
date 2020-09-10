import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    openStartPage();
  }

  openStartPage() async {
    await Future.delayed(
        Duration(seconds: 3), () => Navigator.pushNamed(context, "/home"));
  }

  String id;

  DocumentReference get firestoreRef =>
      Firestore.instance.document('ConsumidorFinal/$id');

  CollectionReference get cartReference => firestoreRef.collection('cart');

  CollectionReference get tokensReference => firestoreRef.collection('tokens');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: Center(
                child: Transform.scale(
                    scale: 1.2, child: Image.asset("assets/logo.png")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
