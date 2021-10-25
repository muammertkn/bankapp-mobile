import 'package:flutter/material.dart';
import 'package:mobile_app/home_page/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeProvider.theme,
    ),
  );
}

class ThemeProvider {
  const ThemeProvider();

  static ThemeData theme = ThemeData(
    primarySwatch: Colors.indigo,
  );
}
