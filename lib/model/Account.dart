//import 'package:json_annotation/json_annotation.dart';

//@JsonSerializable(includeIfNull: false)
class Account {
  int uid;
  String nickName;
  String year;
  String constellation;
  String avatarUrl;
  String birthday;
  int age;
  int status;
  int gender;
  Account({
    this.uid,
    this.nickName,
  });
//  String get nickName{
//    return nickName;
//  }
//  void set nickName(String nickName){
//    this.nickName_=nickName;
//  }
//  Map<String, dynamic> toJson() => <String, dynamic>{
//        'uid': uid,
//        'nickName': nickName,
//      };
//  factory Account.fromJson(Map<String, dynamic> json) => new Account(
//      uid: json['uid'] as int, nickName: json['nickName'] as String);
}
