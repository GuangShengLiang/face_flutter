import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/common/config.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/activity_tab.dart';
import 'package:face_flutter/view/mine_edit.dart';
import 'package:face_flutter/view/my_publish_activity.dart';
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

    List<Widget> wl = new List();
    Config.act_button_list.asMap().forEach((i, value) {
      wl.add(new Expanded(
          child: new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new MyActivityTab(
                            initialIndex: i,
                          )),
                );
              },
              child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  value,
                  style: new TextStyle(fontSize: 12, color: Colors.red),
                ),
              ))));
    });

    //邀请列表
    list.add(new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start, children: wl)));
    list.add(new Divider());
    //我的发布
    list.add(new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new MyPublishActivity()),
          );
        },
        child: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Expanded(
                      flex: 8,
                      child: new Container(
                        padding: const EdgeInsets.all(4.0),
                        child: new Text(
                          "我发布的",
                          style: new TextStyle(fontSize: 12, color: Colors.red),
                        ),
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
