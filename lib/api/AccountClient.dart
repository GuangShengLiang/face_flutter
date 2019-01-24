import 'dart:io';
import 'package:face_flutter/model/Account.dart';
import 'package:dio/dio.dart';

class AccountClient {
//  final String baseUrl = "http://localhost:8080/api";
  final String baseUrl = "http://39.104.140.133/api";
  final String infoUrl = "/account/my_info";
  final String friendsUrl = "/account/friends";
  final String activityUrl = "/activity/activity";
  final String activitiesUrl = "/activity/list";
  var dio;

  AccountClient() {
    Options options = new Options(
        baseUrl: baseUrl,
        connectTimeout: 3000,
        receiveTimeout: 3000,
        contentType: ContentType.json,
        responseType: ResponseType.JSON);
    dio = new Dio(options);
    dio.interceptor.request.onSend = (Options options) async {
//      if(options.method=="POST"||options.method=="PUT"||options.method=="DELETE"){
//
//      }
      options.headers["token"] = "6589affbcb794b97a4ca477c458bbff9";
      return options;
    };
    dio.interceptor.response.onError = (DioError e) {
      // Do something with response error
      if (e.response.statusCode == 601) {
        print(e.response.data);
      }
      return e;
    };
  }

  Future<Account> myInfo() async {
    Response response = await dio.get(infoUrl);
    Account a = new Account();
    a.nickName = response.data['nickName'];
    a.year = response.data['year'];
    a.constellation = response.data['constellation'];
    return a;
  }

  Future<void> updateInfo(String nickName) async {
    await dio.put(infoUrl,
        data: {"nickName": nickName, "gender": 1, "birthday": "2000-01-01"});
  }

  Future<List<Relation>> relations() async {
    Response response =
        await dio.get(friendsUrl);
    List<Relation> rst = new List();
    for (int i = 0; i < response.data.length; i++) {
      Relation a = new Relation();
      a.id = response.data[i]['id'];
      a.uid = response.data[i]['uid'];
      a.rid = response.data[i]['fid'];
      a.type = response.data[i]['type'];
      a.rname = response.data[i]['fname'];
      rst.add(a);
    }
    return rst;
  }

  Future<List<Activity>> activities() async {
    Response response = await dio.get(activitiesUrl);
    List<Activity> rst = new List();
    for (int i = 0; i < response.data.length; i++) {
      Activity a = new Activity();
      a.aid = response.data[i]['aid'];
      a.address = response.data[i]['address'];
      a.title = response.data[i]['title'];
      a.stime = response.data[i]['stime'];
      a.etime = response.data[i]['etime'];
      rst.add(a);
    }
    return rst;
  }

  Future<Activity> activityInfo(String aid) async {
    Response response = await dio.get(activityUrl, data: {"aid": aid});
    Activity a = new Activity();
    a.title = response.data['title'];
    a.stime = response.data['stime'];
    a.etime = response.data['etime'];
    a.address = response.data['address'];
    return a;
  }

  Future<void> addActiviy(Activity act) async {
    await dio.post(activityUrl, data: {
      "title": act.title,
      "address": act.address,
      "detail": act.detail,
      "stime": act.stime,
      "etime": act.etime,
    });
  }
}
