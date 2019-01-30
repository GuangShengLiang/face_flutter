import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:flutter/material.dart';


class FriendDetail extends StatefulWidget {
  final String uid;
  FriendDetail({Key key, @required this.uid}) : super(key: key);
  @override
  _FriendDetailState createState() => new _FriendDetailState(uid:uid);
}

class _FriendDetailState extends State<FriendDetail> {
  Account acc;
  String uid;

  _FriendDetailState({Key key, @required this.uid});

  @override
  void initState() {
    super.initState();
    new AccountClient().info(uid).then((account) {
      setState(() {
        acc = account;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if (acc == null) {
      return new Container();
    }
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Text(acc.nickName,
                  style: new TextStyle(
                      fontSize: 12,
                      color: Colors.red
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Text(acc.year,
                  style: new TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.blue,
                child: new Text(acc.constellation,
                  style: new TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ]
        )
    );
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(acc.nickName,
            style: new TextStyle(fontSize: 14.0, color: Colors.white)),
      ),
      body: new ListView(
        children: [
          new Image.asset(
            'assets/images/ic_main_tab_company_pre.png',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
        ],
      ),
    );
  }
}
