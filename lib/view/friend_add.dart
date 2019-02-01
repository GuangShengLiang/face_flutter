import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class FriendAdd extends StatefulWidget {
  @override
  FriendAddState createState() {
    return FriendAddState();
  }
}

class FriendAddState extends State<FriendAdd> {
  List<Relation> rs;
  bool noFound =false;

  @override
  void initState() {
    super.initState();
    AccountClient.friendRequestList().then((rst) {
      setState(() {
        rs = rst;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget search = Container(
      height: 50.0,
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Padding(
        padding: EdgeInsets.only(left: 18.0, right: 18.0),
//              color: Colors.red,
        child: TextField(
          autofocus: true,
          decoration: new InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: '手机号'),
          onSubmitted: (str) {
            AccountClient.searchByMobile(str).then((r) {
              if (r == null) {
                noFound = true;
              } else {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                      new FriendDetail(ruid: r.uid)),
                );
              }
            });
          },
        ),
      ),
    );
    Widget searchResult = Container(
      padding: EdgeInsets.only(top: 40.0),
      child: new Text(noFound?"没有找到":""),
    );

    List<Widget> list = new List();
    list.add(search);
    list.add(searchResult);
    list.add(new Container(child: new Text("好友请求"),));

    if(rs != null){
      for (var i = 0; i < rs.length; i++) {
        list.add(new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new FriendDetail(ruid: rs[i].ruid)),
            );
          },
          child: new Container(
            child: new ListTile(
              title: new Text(rs[i].rname),
              leading: new Image.asset(
                "assets/images/a002.jpg",
                width: 35.0,
                height: 35.0,
              ),
            ),
            height: 50.0,
            color: Colors.white,
          ),
        ));
        list.add(new Divider(
          height: 4,
        ));
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('搜索'),
          elevation: 0.0,
        ),
        body: ListView(
//          alignment: const Alignment(0.0, -1.0),
          children: list,
        ));
  }
}
