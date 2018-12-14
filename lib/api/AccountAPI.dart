import 'dart:io';
import 'package:face_flutter/model/Account.dart';
import 'package:dio/dio.dart';

//
class AccountAPI {
  static String baseUrl = "http://localhost:8080/api";
  static String infoUrl="/account/info";

  static Options options = new Options(
      baseUrl: baseUrl,
      connectTimeout: 3000,
      receiveTimeout: 3000,
      contentType: ContentType.json,
      responseType: ResponseType.JSON);
  var dio = new Dio(options);

  Future<Account> info() async {
    Response response = await dio.get(infoUrl, data: {"uid": 1});
    Account a = new Account();
    a.nickName = response.data['nickName'];
    a.year = response.data['year'];
    a.constellation = response.data['constellation'];
    return a;
//  return response.data;
  }

  Future<void> updateInfo(String nickName) async {
    await dio.post(infoUrl,data: {"nickName": nickName, "gender": 1, "birthday": "2000-01-01"},options:new Options(headers: {"token": "a"}));
//    http.post(infoUrl,
//        body: {"nickName": nickName, "gender": 1, "birthday": "2000-01-01"},
//        headers: {"token": "a"}).then((response) {
//      print("Response body: ${response.statusCode}");
//    });
  }
}
