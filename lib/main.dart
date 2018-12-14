import 'package:face_flutter/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(new MaterialApp(
    title: "Boss直聘",
    theme: new ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.light,
      primaryColor: Colors.green,
      accentColor: Colors.cyan,
    ),
    home: new SplashPage(),
    localizationsDelegates: [                             //此处
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [                                   //此处
      const Locale('zh','CH'),
      const Locale('en','US'),
    ],
  ));
}
