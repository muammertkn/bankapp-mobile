import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Views/Register-Pages/signInPage.dart';
import 'package:mobile_app/Views/Splash-Page/splashPage.dart';

import 'Views/Page-Navigation/pageNavigation.dart';

void main() {
  runApp(
      /*  DevicePreview(
      builder: (context) => MyApp(),
      enabled: !kReleaseMode,
    ), */
      MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: ThemeProvider.theme,
    );
  }
}

class ThemeProvider {
  const ThemeProvider();

  static ThemeData theme = ThemeData(
    primarySwatch: Colors.deepPurple,
  );
}
