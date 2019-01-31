import 'dart:io';

import 'package:dio/dio.dart';
import 'package:face_flutter/api/global.dart' as global;
import 'package:face_flutter/api/constant.dart';
import 'package:face_flutter/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  global.dio = initDio();
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
Dio initDio(){
  final String baseURL = "http://localhost:8080/api";
//  final String baseURL = "http://39.104.140.133/api";
  Options options = new Options(
      baseUrl: baseURL,
      connectTimeout: 3000,
      receiveTimeout: 3000,
      contentType: ContentType.json,
      responseType: ResponseType.JSON);
  var dio = new Dio(options);
  dio.interceptor.request.onSend = (Options options) async {
//      if(options.method=="POST"||options.method=="PUT"||options.method=="DELETE"){
//
//      }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString(constant.key_token);
    options.headers["token"] = token;
//      options.headers["token"] = "6589affbcb794b97a4ca477c458bbff9";
    return options;
  };
  dio.interceptor.response.onError = (DioError e) {
    // Do something with response error
    if (e.response.statusCode == 601) {
      print(e.response.data);
    }
    return e;
  };
  return dio;
}
