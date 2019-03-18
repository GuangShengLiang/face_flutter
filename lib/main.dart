import 'dart:io';

import 'package:amap_location/amap_location.dart';
import 'package:dio/dio.dart';
import 'package:face_flutter/api/global.dart' as global;
import 'package:face_flutter/api/constant.dart';
import 'package:face_flutter/common/localStorage.dart';
import 'package:face_flutter/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  AMapLocationClient.setApiKey("1c521d4b30c1b38e736fb7399d7b8ba0");
  global.dio = initDio();
  runApp(new MaterialApp(
    title: "face",
    theme: new ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.light,
      primaryColor: Colors.green,
      accentColor: Colors.cyan,
    ),
    home: new SplashPage(),
    localizationsDelegates: [
      //此处
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      //此处
      const Locale('zh', 'CH'),
      const Locale('en', 'US'),
    ],
  ));
}

Dio initDio() {
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
    options.headers["token"] = await LocalStorage.get(constant.key_token);
//      options.headers["token"] = "6589affbcb794b97a4ca477c458bbff9";
    return options;
  };
  dio.interceptor.response.onError = (DioError e) {
    // Do something with response error
    if (e.response == null) {
      print("response is null");
      return e;
    }
    if (e.response.statusCode == 601) {
      print(e.response.data);
    }
    return e;
  };
  return dio;
}
