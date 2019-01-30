import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
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
                    builder: (context) => new FriendDetail(uid:"")),
              );
            },
            child: new Container(
              child: new ListTile(
                title: new Text("张三邀请你吃饭"),
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
        ],
      ),
    );
  }
}
