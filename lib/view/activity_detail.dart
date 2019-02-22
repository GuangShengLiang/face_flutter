import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/friend_detail.dart';
import 'package:flutter/material.dart';

class ActivityDetail extends StatefulWidget {
  final String aid;
  ActivityDetail({Key key, @required this.aid}) : super(key: key);
  @override
  _ActivityDetailState createState() => new _ActivityDetailState(aid: aid);
}

class _ActivityDetailState extends State<ActivityDetail> {
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
    ActivityClient.applyDetail(aid).then((rst) {
      setState(() {
        apply = rst;
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
    Widget cost = new Container(
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
        ]));
    Widget address = new Container(
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
        ]));
    Widget time = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(children: [
          new Container(
            child: new Icon(Icons.av_timer),
          ),
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

    Widget button = new Container(
      child: new RaisedButton(
          child: new Text("已报名"),
          color: Colors.blueGrey,
          onPressed: () {
            ActivityClient.apply(aid);
          }),
    );
    if (apply == null) {
      button = new Container(
        child: new RaisedButton(
            child: new Text("报名"),
            color: Colors.lightGreen,
            onPressed: () {
              ActivityClient.apply(aid);
            }),
      );
    }

    List<Widget> list = new List();
    list.add(new Image.asset(
      'assets/images/ic_main_tab_company_pre.png',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.cover,
    ));
    list.add(cost);
    list.add(address);
    list.add(time);
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
      appBar: new AppBar(),
//      floatingActionButton: new FlatButton(
//        child: new Text(
//          buttonText,
//        ),
//        color: Colors.red,
//        onPressed: _getBtnClickListener,
//      ),
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
              Expanded(
                flex: 3,
                child: button,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
