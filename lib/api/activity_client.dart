import 'package:face_flutter/api/global.dart' as global;
import 'package:face_flutter/model/account.dart';
import 'package:dio/dio.dart';

class ActivityClient {
  static final String activityURL = "/activity/activity";
  static final String listURL = "/activity/list";
  static final String inviteURL = "/activity/invite";
  static final String applyURL = "/activity/apply";
  static var dio = global.dio;

  static Future<List<Activity>> list() async {
    Response response = await dio.get(listURL);
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

  static Future<Activity> detail(String aid) async {
    Response response = await dio.get(activityURL, data: {"aid": aid});
    Activity a = new Activity();
    a.title = response.data['title'];
    a.stime = response.data['stime'];
    a.etime = response.data['etime'];
    a.address = response.data['address'];
    return a;
  }

  static Future<void> add(Activity act) async {
    await dio.post(activityURL, data: {
      "title": act.title,
      "address": act.address,
      "detail": act.detail,
      "stime": act.stime,
      "etime": act.etime,
    });
  }

  static Future<void> apply(String aid) async {
    await dio.post(applyURL, data: {
      "aid": aid,
    });
  }

  static Future<Apply> applyDetail(String aid) async {
    Response response = await dio.get(applyURL, data: {
      "aid": aid,
    });
    if (response.data == null || response.data == "") {
      return null;
    }
    Apply a = new Apply();
    a.id = response.data['id'];
    a.aid = response.data['aid'];
    a.status = response.data['status'];
    return a;
  }

  static Future<void> invite(String aid, String iuid) async {
    await dio.post(inviteURL, data: {
      "aid": aid,
      "iuid": iuid,
    });
  }
}
