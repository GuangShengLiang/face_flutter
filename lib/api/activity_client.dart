import 'package:face_flutter/api/global.dart' as global;
import 'package:face_flutter/model/account.dart';
import 'package:dio/dio.dart';

class ActivityClient {
  static final String activityURL = "/activity/activity";
  static final String activitiesURL = "/activity/list";
  static final String activityInviteURL = "/activity/invite";
  static final String activityApplyURL = "/activity/apply";
  static var dio = global.dio;

  static Future<List<Activity>> activities() async {
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

  static Future<Activity> activityInfo(String aid) async {
    Response response = await dio.get(activityURL, data: {"aid": aid});
    Activity a = new Activity();
    a.title = response.data['title'];
    a.stime = response.data['stime'];
    a.etime = response.data['etime'];
    a.address = response.data['address'];
    return a;
  }

  static Future<void> activityAdd(Activity act) async {
    await dio.post(activityURL, data: {
      "title": act.title,
      "address": act.address,
      "detail": act.detail,
      "stime": act.stime,
      "etime": act.etime,
    });
  }

  static Future<void> activityApply(String aid) async {
    await dio.post(activityApplyURL, data: {
      "aid": aid,
    });
  }

  static Future<Apply> activityApplyDetail(String aid) async {
    Response response = await dio.get(activityApplyURL, data: {
      "aid": aid,
    });
    if (response.data == null) {
      return null;
    }
    Apply a = new Apply();
    a.id = response.data['id'];
    a.aid = response.data['aid'];
    a.status = response.data['status'];
    return a;
  }

  static Future<void> activityInvite(String aid, String iuid) async {
    await dio.post(activityInviteURL, data: {
      "aid": aid,
      "iuid": iuid,
    });
  }
}
