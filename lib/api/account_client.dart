import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/api/global.dart' as global;
import 'package:dio/dio.dart';

class AccountClient {
  static final String myInfoURL = "/account/my_info";
  static final String infoURL = "/account/info";
  static final String friendURL = "/account/friend";
  static final String friendsURL = "/account/friends";
  static final String friendRequestURL = "/account/friend_request";
  static final String friendRequestListURL = "/account/friend_request_list";
  static final String relationURL = "/account/relation";
  static final String searchURL = "/account/search_mobile";
  static var dio = global.dio;

  static Future<Account> myInfo() async {
    Response p = await dio.get(myInfoURL);
    Account a = new Account();
    a.nickName = p.data['nickName'];
    a.year = p.data['year'];
    a.constellation = p.data['constellation'];
    return a;
  }

  static Future<Account> info(String uid) async {
    Response p = await dio.get(infoURL, data: {
      "uid": uid,
    });
    Account a = new Account();
    a.nickName = p.data['nickName'];
    a.year = p.data['year'];
    a.constellation = p.data['constellation'];
    return a;
  }

  static Future<void> updateInfo(String nickName) async {
    await dio.put(infoURL,
        data: {"nickName": nickName, "gender": 1, "birthday": "2000-01-01"});
  }

  static Future<Account> searchByMobile(String mobile) async {
    Response p = await dio.get(searchURL, data: {"mobile": mobile});
    if (p.data == null || p.data == "") {
      return null;
    }
    Account a = new Account();
    a.uid = p.data['uid'];
    a.nickName = p.data['nickName'];
    a.year = p.data['year'];
    a.constellation = p.data['constellation'];
    return a;
  }

  static Future<Relation> relation(String ruid) async {
    Response p = await dio.get(relationURL, data: {"ruid": ruid});
    if (p.data == null || p.data == "") {
      return null;
    }
    Relation a = new Relation();
    a.uid = p.data['uid'];
    a.ruid = p.data['ruid'];
    a.type = p.data['type'];
    return a;
  }

  static Future<void> friendRequest(String ruid) async {
    await dio.post(friendRequestURL, data: {"ruid": ruid});
  }

  static Future<List<Relation>> friendRequestList() async {
    Response p = await dio.get(friendRequestListURL);
    List<Relation> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Relation a = new Relation();
      a.id = p.data[i]['id'];
      a.uid = p.data[i]['uid'];
      a.ruid = p.data[i]['ruid'];
      a.rname = p.data[i]['rname'];
      rst.add(a);
    }
    return rst;
  }

  static Future<void> friend(String ruid) async {
    await dio.post(friendURL, data: {"ruid": ruid});
  }

  static Future<List<Relation>> friends() async {
    Response p = await dio.get(friendsURL);
    List<Relation> rst = new List();
    for (int i = 0; i < p.data.length; i++) {
      Relation a = new Relation();
      a.id = p.data[i]['id'];
      a.uid = p.data[i]['uid'];
      a.ruid = p.data[i]['ruid'];
      a.type = p.data[i]['type'];
      a.rname = p.data[i]['rname'];
      rst.add(a);
    }
    return rst;
  }
}
