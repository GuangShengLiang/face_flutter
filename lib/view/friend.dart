import 'package:face_flutter/api/AccountClient.dart';
import 'package:face_flutter/model/Account.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class FriendTab extends StatefulWidget{
  @override
  _FriendTabWidgetState createState() => new _FriendTabWidgetState();
}
class _FriendTabWidgetState extends State<FriendTab> {
  List<Relation> rs;
  @override
  void initState() {
    super.initState();
    new AccountClient().relations().then((rst) {
      setState(() {
        rs = rst;
        print(rs);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (rs == null) {
      return new Container();
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
//              Navigator.push(
//                context,
//                new MaterialPageRoute(builder: (context) => new MineEdit()),
//              );
            },
          ),
        ],
      ),
      body: new ListView(
        children: friendList(context),
      ),
    );
  }
  friendList(BuildContext context) {
    List<Widget> l = new List<Widget>();
    for (var i = 0; i < rs.length; i++) {
      l.add(new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new FriendDetail()),
          );
        },
        child:  new Container(
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
      l.add(new Divider(
        height: 4,
      ));
    }
    return l;
  }
  }
