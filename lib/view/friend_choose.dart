import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/friend_add.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class FriendChooseTab extends StatefulWidget {
  String aid;
  FriendChooseTab({Key key, @required this.aid}) : super(key: key);

  @override
  _FriendTabWidgetState createState() => new _FriendTabWidgetState(aid: aid);
}

class _FriendTabWidgetState extends State<FriendChooseTab> {
  List<Relation> rs;
  String aid;
  List<bool> checked = new List();
  _FriendTabWidgetState({Key key, @required this.aid});

  @override
  void initState() {
    AccountClient.friends().then((rst) {
      setState(() {
        rs = rst;
        if (rs != null) {
          rs.asMap().forEach((i, v) {
            checked.add(false);
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (rs == null) {
      return new Container();
    }
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < rs.length; i++) {
      list.add(
        new CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: new Text(rs[i].rname),
            value: checked[i],
            onChanged: (v) => setState(() {
                  checked[i] = v;
                })),
      );
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
              List<String> iuids = new List();
              checked.asMap().forEach((i, v) {
                if (v) {
                  iuids.add(rs[i].ruid);
                }
              });
              ActivityClient.invite(aid, iuids);
              Navigator.pop(context);
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
