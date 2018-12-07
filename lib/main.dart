import 'package:face_flutter/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "Boss直聘",
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: Colors.green,
        accentColor: Colors.cyan,
      ),
      home: new SplashPage()));
}

