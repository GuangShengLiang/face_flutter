import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class FriendAdd extends StatefulWidget {
  @override
  FriendAddState createState() {
    return FriendAddState();
  }
}

class FriendAddState extends State<FriendAdd> {
  bool noFound =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('搜索'),
          elevation: 0.0,
        ),
        body: Stack(
          alignment: const Alignment(0.0, -1.0),
          children: <Widget>[
            Container(
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
                    AccountClient().searchByMobile(str).then((r) {
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
            ),
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: new Text(noFound?"没有找到":""),
            )
          ],
        ));
  }
}
