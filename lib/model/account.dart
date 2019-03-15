class Account {
  String uid;
  String nickName="";
  String year="";
  String constellation="";
  String avatarUrl="";
  String birthday="";
  int age;
  int status;
  int gender;
  Account({
    this.uid,
    this.nickName,
  });
}

class Activity{
  String aid;
  String uid;
  String uname;
  String title;
  String subTitle;
  int pubType;
  String detail;
  String address;
  String period;
  double latitude;
  double longitude;
  String startTime;
  String endTime;
  String stime;
  String etime;
}
class Apply{
  int id;
  String aid;
  int status;
  String title;
  String statusName;
}
class Invite{
  int id;
  String aid;
  String iuid;
  String iname;
  int status;
  String title;
  String statusName;
}
class Relation{
  int id;
  String uid;
  String ruid;
  int type;
  String remark;
  String rname;

}
