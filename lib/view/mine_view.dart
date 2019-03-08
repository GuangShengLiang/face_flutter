import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:face_flutter/view/mine_edit.dart';
import 'package:flutter/material.dart';

class MineTab extends StatefulWidget {
  @override
  _MineTabWidgetState createState() => new _MineTabWidgetState();
}

class _MineTabWidgetState extends State<MineTab> {
  Account acc;

  @override
  void initState() {
    super.initState();
    AccountClient.myInfo().then((account) {
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
    List<Widget> list = new List();
    //头像
    list.add(new Image.asset(
      'assets/images/ic_main_tab_company_pre.png',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.cover,
    ));
    //year
    list.add(new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          new Container(
            padding: const EdgeInsets.all(4.0),
            child: new Text(
              acc.nickName,
              style: new TextStyle(fontSize: 12, color: Colors.red),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(4.0),
            child: new Text(
              acc.year,
              style: new TextStyle(
                fontSize: 12,
                color: Colors.orange,
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(4.0),
            color: Colors.blue,
            child: new Text(
              acc.constellation,
              style: new TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ])));
    list.add(new Divider());
    //邀请列表
    list.add(new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          new Expanded(
              child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new FriendDetail(ruid: "")),
                    );
                  },
                  child: new Container(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "待参加",
                      style: new TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ))),
          new Expanded(
              child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new FriendDetail(ruid: "")),
                    );
                  },
                  child: new Container(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "待审核",
                      style: new TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ))),
          new Expanded(
              child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new FriendDetail(ruid: "")),
                    );
                  },
                  child: new Container(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "我的邀请",
                      style: new TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ))),
          new Expanded(
              child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new FriendDetail(ruid: "")),
                    );
                  },
                  child: new Container(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "发出的邀请",
                      style: new TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ))),
          new Expanded(
              child: new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new FriendDetail(ruid: "")),
              );
            },
            child: new Container(
              padding: const EdgeInsets.all(4.0),
              child: new Text(
                "待参加",
                style: new TextStyle(fontSize: 12, color: Colors.red),
              ),
            ),
          )),
        ])));
    list.add(new Divider());
    //我的发布
    list.add(new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new FriendDetail(ruid: "")),
          );
        },
        child: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Expanded(
                      child: new Container(
                    padding: const EdgeInsets.all(4.0),
                    child: new Icon(Icons.send),
                  )),
                  new Expanded(
                      flex: 8,
                      child: new Container(
                        padding: const EdgeInsets.all(4.0),
                        child: new Text(
                          "我发布的",
                          style: new TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      )),
                  new Expanded(
                      child: new Container(
                    padding: const EdgeInsets.all(4.0),
                    child: new Icon(Icons.arrow_forward),
                  )),
                ]))));
    list.add(new Divider());

    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('我的',
            style: new TextStyle(fontSize: 14.0, color: Colors.white)),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new MineEdit()),
              );
            },
          ),
        ],
      ),
      body: new ListView(children: list),
    );
  }
}
