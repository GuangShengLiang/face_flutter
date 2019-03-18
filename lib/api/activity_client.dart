import 'package:face_flutter/api/global.dart' as global;
import 'package:face_flutter/model/account.dart';
import 'package:dio/dio.dart';

class ActivityClient {
  static final String activityURL = "/activity/activity";
  static final String listURL = "/activity/list";
  static final String myPublishListURL = "/activity/my_publish/list";
  static final String myListURL = "/activity/my/list";
  static final String myPendingListURL = "/activity/pending/list";
  static final String myParticipatedListURL = "/activity/participated/list";
  static final String inviteURL = "/activity/invite";
  static final String inviteAgreeURL = "/activity/invite/agree";
  static final String inviteRejectURL = "/activity/invite/reject";
  static final String invitedListURL = "/activity/invited/list";
  static final String inviteListURL = "/activity/invite/list";
  static final String memberURL = "/activity/activity/member";
  static final String applyURL = "/activity/apply";
  static final String applyListURL = "/activity/apply/list";
  static final String applyApprovalListURL = "/activity/apply/list/approval";
  static final String applyCancelURL = "/activity/apply/cancle";
  static final String applyAgreeURL = "/activity/apply/agree";
  static final String applyRejectURL = "/activity/apply/reject";
  static var dio = global.dio;

  static Future<List<Activity>> list() async {
    Response p = await dio.get(listURL, data: {"fromId": 0});
    List<Activity> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Activity a = new Activity();
      a.aid = p.data[i]['aid'];
      a.uid = p.data[i]['uid'];
      a.uname = p.data[i]['uname'];
      a.address = p.data[i]['address'];
      a.title = p.data[i]['title'];
      a.period = p.data[i]['period'];
      a.startTime = p.data[i]['startTime'];
      a.endTime = p.data[i]['endTime'];
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
      a.startTime = p.data[i]['startTime'];
      a.endTime = p.data[i]['endTime'];
      rst.add(a);
    }
    return rst;
  }
  static Future<List<Activity>> myParticipatedList() async {
    Response p = await dio.get(myParticipatedListURL);
    List<Activity> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Activity a = new Activity();
      a.aid = p.data[i]['aid'];
      a.address = p.data[i]['address'];
      a.title = p.data[i]['title'];
      a.period = p.data[i]['period'];
      a.uname = p.data[i]['uname'];
      a.startTime = p.data[i]['startTime'];
      a.endTime = p.data[i]['endTime'];
      rst.add(a);
    }
    return rst;
  }
  static Future<List<Activity>> myList() async {
    Response p = await dio.get(myListURL);
    List<Activity> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Activity a = new Activity();
      a.aid = p.data[i]['aid'];
      a.address = p.data[i]['address'];
      a.title = p.data[i]['title'];
      a.period = p.data[i]['period'];
      a.uname = p.data[i]['uname'];
      a.startTime = p.data[i]['startTime'];
      a.endTime = p.data[i]['endTime'];
      rst.add(a);
    }
    return rst;
  }
  static Future<List<Activity>> myPendingList() async {
    Response p = await dio.get(myPendingListURL);
    List<Activity> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Activity a = new Activity();
      a.aid = p.data[i]['aid'];
      a.address = p.data[i]['address'];
      a.title = p.data[i]['title'];
      a.period = p.data[i]['period'];
      a.uname = p.data[i]['uname'];
      a.startTime = p.data[i]['startTime'];
      a.endTime = p.data[i]['endTime'];
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
      "startTime": act.startTime,
      "endTime": act.endTime,
    });
  }

  static Future<void> edit(Activity act) async {
    await dio.put(activityURL, data: {
      "aid": act.aid,
      "title": act.title,
      "address": act.address,
      "detail": act.detail,
      "startTime": act.startTime,
      "endTime": act.endTime,
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

  static Future<void> invite(String aid, List<String> iuid) async {
    await dio.post(inviteURL, data: {
      "aid": aid,
      "iuid": iuid,
    });
  }

  static Future<void> inviteAgree(int id) async {
    await dio.put(inviteAgreeURL, data: {
      "id": id,
    });
  }

  static Future<void> inviteReject(int id) async {
    await dio.put(inviteRejectURL, data: {
      "id": id,
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
  static Future<List<Invite>> inviteList() async {
  Response p = await dio.get(inviteListURL);
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
