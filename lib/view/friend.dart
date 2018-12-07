import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class FriendTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        children: [
          new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new FriendDetail()),
              );
            },
            child: new Container(
              child: new ListTile(
                title: new Text("张三的歌"),
                leading: new Image.asset(
                  "assets/images/a001.jpg",
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              height: 50.0,
              color: Colors.white,
            ),
          ),
          new Divider(
            height: 1,
          ),
          new Container(
            child: new ListTile(
              title: new Text("班主任"),
              leading: new Image.asset(
                "assets/images/a002.jpg",
                width: 35.0,
                height: 35.0,
              ),
            ),
            height: 50.0,
            color: Colors.white,
          ),
          new Divider(
            height: 1,
          ),
          new Container(
            child: new ListTile(
              title: new Text("LebronJames"),
              leading: new Image.asset(
                "assets/images/a003.jpg",
                width: 35.0,
                height: 35.0,
              ),
            ),
            height: 50.0,
            color: Colors.white,
          ),
          new Divider(
            height: 1,
          ),
          new Container(
            child: new ListTile(
              title: new Text("石甲州"),
              leading: new Image.asset(
                "assets/images/a004.jpg",
                width: 35.0,
                height: 35.0,
              ),
            ),
            height: 50.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
