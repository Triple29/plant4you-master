import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plantforyou/screens/Intro_page.dart';
//import 'package:plantforyou/screens/Intro_page2.dart';
import 'package:plantforyou/screens/cart.dart';
import 'package:plantforyou/screens/fav.dart';
import 'package:plantforyou/screens/homes_page.dart';
import 'package:plantforyou/screens/login_page.dart';
import 'package:plantforyou/screens/profile_page.dart';

import 'package:plantforyou/screens/signin_page.dart';
import 'package:plantforyou/components/menubar.dart';
import 'package:plantforyou/screens/caladium.dart';
import 'package:plantforyou/screens/calathea.dart';
import 'package:plantforyou/screens/monstera.dart';
import 'package:plantforyou/screens/philodentron.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var product;
    return MaterialApp(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: IntroPage(),
    );
  }
}
