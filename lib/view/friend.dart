import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/friend_add.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class FriendTab extends StatefulWidget {
  @override
  _FriendTabWidgetState createState() => new _FriendTabWidgetState();
}

class _FriendTabWidgetState extends State<FriendTab> {
  List<Relation> rs;
  @override
  void initState() {
    super.initState();
    AccountClient.friends().then((rst) {
      setState(() {
        rs = rst;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (rs == null) {
      return new Container();
    }
    List<Widget> list = new List<Widget>();
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
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('玩伴',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Next choice',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new FriendAdd()),
              );
            },
          ),
        ],
      ),
      body: new ListView(
        children: list,
      ),
    );
  }
}
