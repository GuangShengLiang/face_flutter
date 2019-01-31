import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/api/global.dart' as global;
import 'package:dio/dio.dart';

class AccountClient {
  final String myInfoURL = "/account/my_info";
  final String infoURL = "/account/info";
  final String friendsURL = "/account/friends";
  final String friendRequestURL = "/account/friend_request";
  final String relationURL = "/account/relation";
  final String searchURL = "/account/search_mobile";
  var dio = global.dio;

  Future<Account> myInfo() async {
    Response response = await dio.get(myInfoURL);
    Account a = new Account();
    a.nickName = response.data['nickName'];
    a.year = response.data['year'];
    a.constellation = response.data['constellation'];
    return a;
  }

  Future<Account> info(String uid) async {
    Response response = await dio.get(infoURL, data: {
      "uid": uid,
    });
    Account a = new Account();
    a.nickName = response.data['nickName'];
    a.year = response.data['year'];
    a.constellation = response.data['constellation'];
    return a;
  }

  Future<void> updateInfo(String nickName) async {
    await dio.put(infoURL,
        data: {"nickName": nickName, "gender": 1, "birthday": "2000-01-01"});
  }

  Future<Account> searchByMobile(String mobile) async {
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

  Future<Relation> relation(String ruid) async {
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

  Future<void> friendRequest(String ruid) async {
    await dio.post(friendRequestURL, data: {"ruid": ruid});
  }

  Future<List<Relation>> friends() async {
    Response response = await dio.get(friendsURL);
    List<Relation> rst = new List();
    for (int i = 0; i < response.data.length; i++) {
      Relation a = new Relation();
      a.id = response.data[i]['id'];
      a.uid = response.data[i]['uid'];
      a.ruid = response.data[i]['ruid'];
      a.type = response.data[i]['type'];
      a.rname = response.data[i]['rname'];
      rst.add(a);
    }
    return rst;
  }
}
