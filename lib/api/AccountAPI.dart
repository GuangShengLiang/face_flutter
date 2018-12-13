import 'dart:convert';
import 'package:face_flutter/model/Account.dart';
import 'package:http/http.dart' as http;

//
//import 'package:dio/dio.dart';
//import 'package:face_flutter/model/Account.dart';
//
class AccountAPI {
//
//  Future<String> accountInfo() async {
//    String url = "http://localhost:8080/api/account/info?uid=1";
////    var response = await http.get(
////      Uri.encodeFull(url),
////    );
//    var dio = new Dio();
//    Response response;
//    response=await dio.get(url);
//    print(response.data);
//    Account a =Account.fromJson(response.data) ;
//  }
//
  Future<Account> accountInfo() async {
    String url = "http://localhost:8080/api/account/info?uid=1";
    var response = await http.get(
      Uri.encodeFull(url),
    );
//    var dio = new Dio();
//    Response response;
//    response=await dio.get(url);
//    print(response.data);
    Account a = new Account();
    Map<String, dynamic> user = json.decode(response.body);
    a.nickName = user["nickName"];
    a.year = user['year'];
    a.constellation = user['constellation'];
    return a;
  }

  Future<void> updateAccountInfo(String nickName) async {
    var url = "http://localhost:8080/api/account/info";
    http.post(url, body: {"nickName": nickName, "gender":1,"birthday":"2000-01-01"},headers: {"token":"a"})
        .then((response) {
      print("Response body: ${response.statusCode}");
    });
  }
}
