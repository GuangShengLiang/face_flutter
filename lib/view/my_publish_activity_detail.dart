import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/activity_edit.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class MyPublishActivityDetail extends StatefulWidget {
  final String aid;
  MyPublishActivityDetail({Key key, @required this.aid}) : super(key: key);
  @override
  _ActivityDetailState createState() => new _ActivityDetailState(aid: aid);
}

class _ActivityDetailState extends State<MyPublishActivityDetail> {
  final String aid;
  Activity acc;
  Apply apply;
  List<Account> rs;

  @override
  void initState() {
    super.initState();
    ActivityClient.detail(aid).then((rst) {
      setState(() {
        acc = rst;
      });
    });
    ActivityClient.member(aid).then((rst) {
      setState(() {
        rs = rst;
      });
    });
  }

  String period = '11-10 10:00--13:00';

  _ActivityDetailState({Key key, @required this.aid});

  @override
  Widget build(BuildContext context) {
    if (acc == null || rs == null) {
      return new Container();
    }
    List<Widget> list = new List();
    list.add(new Image.asset(
      'assets/images/ic_main_tab_company_pre.png',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.cover,
    ));

    //费用
    list.add(new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(children: [
          new Container(
            child: new Icon(Icons.attach_money),
          ),
          new Container(
            padding: const EdgeInsets.all(2.0),
            child: new Text(
              "AA制",
              style: new TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
        ])));
    //时间
    list.add(new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(children: [
          new Container(
            child: new Icon(Icons.av_timer),
          ),
          new Container(
            padding: const EdgeInsets.all(2.0),
            color: Colors.orange,
            child: new Text(
              acc.stime + " - " + acc.etime,
              style: new TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ])));
    //地点
    list.add(new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(children: [
          new Container(
            child: new Icon(Icons.location_on),
          ),
          new Container(
            padding: const EdgeInsets.all(2.0),
            child: new Text(
              acc.address,
              style: new TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
        ])));

    //参与者
    if (rs != null) {
      List<Widget> rls = new List<Widget>();
      for (var i = 0; i < rs.length; i++) {
        rls.add(new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new FriendDetail(ruid: rs[i].uid)),
              );
            },
            child: Container(
                child: Column(children: <Widget>[
              Image.asset(
                "assets/images/a002.jpg",
                width: 50.0,
                height: 50.0,
              ),
              new Text(rs[i].nickName)
            ]))));
      }
      list.add(Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0,
        children: rls,
      ));
    }

    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new ActivityEdit(aid: aid,)),
              );
            },
          ),
        ],
      ),
      body: new ListView(
        children: list,
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Container(
          child: new Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: new Container(
                    child: new IconButton(
                        onPressed: () {}, icon: Icon(Icons.share)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

