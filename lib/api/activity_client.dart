import 'package:face_flutter/api/global.dart' as global;
import 'package:face_flutter/model/account.dart';
import 'package:dio/dio.dart';

class ActivityClient {
  static final String activityURL = "/activity/activity";
  static final String listURL = "/activity/list";
  static final String myPublishListURL = "/activity/my_publish/list";
  static final String inviteURL = "/activity/invite";
  static final String invitedListURL = "/activity/invited/list";
  static final String memberURL = "/activity/activity/member";
  static final String applyURL = "/activity/apply";
  static final String applyListURL = "/activity/apply/list";
  static final String applyApprovalListURL = "/activity/apply/list/approval";
  static final String applyCancelURL = "/activity/apply/cancle";
  static final String applyAgreeURL = "/activity/apply/agree";
  static final String applyRejectURL = "/activity/apply/reject";
  static var dio = global.dio;

  static Future<List<Activity>> list() async {
    Response p = await dio.get(listURL);
    List<Activity> rst = new List();
    for (int i = 0; i < p.data.data.length; i++) {
      Activity a = new Activity();
      a.aid = p.data.data[i]['aid'];
      a.uid = p.data.data[i]['uid'];
      a.uname = p.data.data[i]['uname'];
      a.address = p.data.data[i]['address'];
      a.title = p.data.data[i]['title'];
      a.stime = p.data.data[i]['stime'];
      a.etime = p.data.data[i]['etime'];
      rst.add(a);
    }
    return rst;
  }

  static Future<List<Activity>> myPublish() async {
    Response p = await dio.get(myPublishListURL);
    List<Activity> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Activity a = new Activity();
      a.aid = p.data[i]['aid'];
      a.address = p.data[i]['address'];
      a.title = p.data[i]['title'];
      a.stime = p.data[i]['stime'];
      a.etime = p.data[i]['etime'];
      rst.add(a);
    }
    return rst;
  }

  static Future<List<Account>> member(String aid) async {
    Response p = await dio.get(memberURL, data: {"aid": aid});
    List<Account> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Account a = new Account();
      a.uid = p.data[i]['uid'];
      a.nickName = p.data[i]['nickName'];
      a.avatarUrl = p.data[i]['avatarUrl'];
      rst.add(a);
    }
    return rst;
  }

  static Future<Activity> detail(String aid) async {
    Response p = await dio.get(activityURL, data: {"aid": aid});
    Activity a = new Activity();
    a.title = p.data['title'];
    a.stime = p.data['stime'];
    a.etime = p.data['etime'];
    a.address = p.data['address'];
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

  static Future<void> applyCancle(int id) async {
    await dio.put(applyCancelURL, data: {
      "id": id,
    });
  }

  static Future<void> applyAgree(int id) async {
    await dio.put(applyAgreeURL, data: {
      "id": id,
    });
  }

  static Future<void> applyReject(int id) async {
    await dio.put(applyRejectURL, data: {
      "id": id,
    });
  }

  static Future<Apply> applyDetail(String aid) async {
    Response p = await dio.get(applyURL, data: {
      "aid": aid,
    });
    if (p.data == null || p.data == "") {
      return null;
    }
    Apply a = new Apply();
    a.id = p.data['id'];
    a.aid = p.data['aid'];
    a.status = p.data['status'];
    return a;
  }

  static Future<void> invite(String aid, String iuid) async {
    await dio.post(inviteURL, data: {
      "aid": aid,
      "iuid": iuid,
    });
  }

  static Future<List<Apply>> applyList() async {
    Response p = await dio.get(applyListURL);
    List<Apply> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Apply a = new Apply();
      a.id = p.data[i]['id'];
      a.aid = p.data[i]['aid'];
      a.status = p.data[i]['status'];
      a.statusName = p.data[i]['statusName'];
      a.title = p.data[i]['title'];
      rst.add(a);
    }
    return rst;
  }

  static Future<List<Apply>> applyApprovalList() async {
    Response p = await dio.get(applyApprovalListURL);
    List<Apply> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Apply a = new Apply();
      a.id = p.data[i]['id'];
      a.aid = p.data[i]['aid'];
      a.status = p.data[i]['status'];
      a.statusName = p.data[i]['statusName'];
      a.title = p.data[i]['title'];
      rst.add(a);
    }
    return rst;
  }

  static Future<List<Invite>> invitedList() async {
    Response p = await dio.get(invitedListURL);
    List<Invite> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Invite a = new Invite();
      a.id = p.data[i]['id'];
      a.iuid = p.data[i]['iuid'];
      a.iname = p.data[i]['iname'];
      a.aid = p.data[i]['aid'];
      a.status = p.data[i]['status'];
      a.statusName = p.data[i]['statusName'];
      a.title = p.data[i]['title'];
      rst.add(a);
    }
    return rst;
  }
}
