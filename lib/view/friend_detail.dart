import 'package:face_flutter/view/mine_edit.dart';
import 'package:flutter/material.dart';

class FriendDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Text('Don',
                  style: new TextStyle(
                      fontSize: 12,
                      color: Colors.red
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Text('89',
                  style: new TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.blue,
                child: new Text('巨蟹座',
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
