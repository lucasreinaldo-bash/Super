import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superlogicamavel/contador_bind.dart';
import 'package:superlogicamavel/contador_page.dart';
import 'package:superlogicamavel/home/home_bind.dart';
import 'package:superlogicamavel/home/home_page.dart';
import 'package:superlogicamavel/home/screen_menu.dart';
import 'package:superlogicamavel/login/login_binding.dart';
import 'package:superlogicamavel/splash_screen/splash_binding.dart';
import 'package:superlogicamavel/splash_screen/splash_page.dart';

import 'login/login_page.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/screen': (BuildContext context) => new ScreenMenu(),
        '/home': (BuildContext context) => new HomePage(),
      },
    ));
