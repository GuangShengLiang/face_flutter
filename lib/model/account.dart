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
  String title;
  String subTitle;
  String detail;
  String address;
  String stime;
  String etime;
}
class Apply{
  int id;
  String aid;
  int status;
}
class Relation{
  int id;
  String uid;
  String ruid;
  int type;
  String remark;
  String rname;

}
