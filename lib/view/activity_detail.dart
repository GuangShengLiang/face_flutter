import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:flutter/material.dart';

class ActivityDetail extends StatefulWidget {
  final String aid;
  ActivityDetail({Key key, @required this.aid}) : super(key: key);
  @override
  _ActivityDetailState createState() => new _ActivityDetailState(aid: aid);
}

class _ActivityDetailState extends State<ActivityDetail> {
  bool _isButton1Disabled = true;
  String buttonText = "报名";
  final String aid;
  Activity acc;

  @override
  void initState() {
    super.initState();
    ActivityClient.activityInfo(aid).then((rst) {
      setState(() {
        acc = rst;
      });
    });
    ActivityClient.activityApplyDetail(aid).then((rst) {
      setState(() {
        if (rst != null) {
          _isButton1Disabled = false;
          buttonText = "已报名";
        }
      });
    });
  }

  String period = '2018-11-10 10:00--2018-11-10 13:00';
  String partner = "张三，李四";

  _ActivityDetailState({Key key, @required this.aid});

  @override
  Widget build(BuildContext context) {
    if (acc == null) {
      return new Container();
    }
    Widget title = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(children: [
          new Container(
            padding: const EdgeInsets.all(2.0),
            child: new Text(
              acc.address,
              style: new TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
        ]));
    Widget time = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(children: [
          new Container(
            padding: const EdgeInsets.all(2.0),
            color: Colors.orange,
            child: new Text(
              period,
              style: new TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ]));
    Widget person = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          new Container(
            padding: const EdgeInsets.all(2.0),
            child: new Text(
              partner,
              style: new TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
        ]));
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(),
      floatingActionButton: new FlatButton(
        child: new Text(
          buttonText,
        ),
        color: Colors.blue,
        onPressed: _getBtnClickListener,
      ),
      body: new ListView(
        children: [
          new Image.asset(
            'assets/images/ic_main_tab_company_pre.png',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          title,
          time,
          person,
        ],
      ),
    );
  }

  _getBtnClickListener() {
    if (_isButton1Disabled) {
      return null;
    } else {
      return () {
        ActivityClient.activityApply(aid);
      };
    }
  }
}
