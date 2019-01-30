import 'dart:io';
import 'package:face_flutter/api/global.dart' as global;
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/api/constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityClient {
//  final String baseURL = "http://localhost:8080/api";
  final String baseURL = "http://39.104.140.133/api";
  final String activityURL = "/activity/activity";
  final String activitiesURL = "/activity/list";
  final String activityInviteURL = "/activity/invite";
  final String activityApplyURL = "/activity/apply";
  var dio = global.dio;

  AccountClient() {
    Options options = new Options(
        baseUrl: baseURL,
        connectTimeout: 3000,
        receiveTimeout: 3000,
        contentType: ContentType.json,
        responseType: ResponseType.JSON);
    dio = new Dio(options);
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
  }

  Future<List<Activity>> activities() async {
    Response response = await dio.get(activitiesURL);
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
    Response response = await dio.get(activityURL, data: {"aid": aid});
    Activity a = new Activity();
    a.title = response.data['title'];
    a.stime = response.data['stime'];
    a.etime = response.data['etime'];
    a.address = response.data['address'];
    return a;
  }

  Future<void> activityAdd(Activity act) async {
    await dio.post(activityURL, data: {
      "title": act.title,
      "address": act.address,
      "detail": act.detail,
      "stime": act.stime,
      "etime": act.etime,
    });
  }

  Future<void> activityApply(String aid) async {
    await dio.post(activityApplyURL, data: {
      "aid": aid,
    });
  }
  Future<Apply> activityApplyDetail(String aid) async {
  Response response = await dio.get(activityApplyURL, data: {
  "aid": aid,
  });
  if (response.data == null){
    return null;
  }
  Apply a = new Apply();
  a.id = response.data['id'];
  a.aid = response.data['aid'];
  a.status = response.data['status'];
  return a;
  }

  Future<void> activityInvite(String aid, String iuid) async {
    await dio.post(activityInviteURL, data: {
      "aid": aid,
      "iuid": iuid,
    });
  }
}