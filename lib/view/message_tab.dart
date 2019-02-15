import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:flutter/material.dart';

class MessageTab extends StatefulWidget {
  @override
  MessageTabState createState() {
    return MessageTabState();
  }
}

class MessageTabState extends State<MessageTab> {
  List<Apply> applyList;
  List<Apply> approvalList;
  List<Activity> myPublish;

  @override
  void initState() {
    super.initState();
    ActivityClient.applyList().then((rst) {
      setState(() {
        applyList = rst;
      });
    });
    ActivityClient.myPublish().then((rst) {
      setState(() {
        myPublish = rst;
      });
    });
    ActivityClient.applyApprovalList().then((rst) {
      setState(() {
        approvalList = rst;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    if (applyList != null) {
      for (var i = 0; i < applyList.length; i++) {
        list.add(
          new ListTile(
            title: new Text(applyList[i].title,
                style:
                    new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
            subtitle: new Text(applyList[i].statusName),
          ),
        );
        list.add(new Divider());
      }
    }
    List<Widget> plist = new List<Widget>();
    if (myPublish != null) {
      for (var i = 0; i < myPublish.length; i++) {
        plist.add(
          new ListTile(
            title: new Text(myPublish[i].title,
                style:
                    new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
            subtitle: new Text(myPublish[i].address),
          ),
        );
        plist.add(new Divider());
      }
    }
    List<Widget> alist = new List<Widget>();
    if (approvalList != null) {
      for (var i = 0; i < approvalList.length; i++) {
        alist.add(
          new Container(
            child: new Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: new Column(
                    children: <Widget>[
                      new Text(approvalList[i].title),
                      new Text(approvalList[i].statusName)
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: new Column(
                      children: <Widget>[
                        new FlatButton(
                          child: Text("同意"),
                          onPressed: () {
                            ActivityClient.applyAgree(approvalList[i].id);
                          },
                        ),
                        new FlatButton(
                          child: Text("拒绝"),
                          onPressed: () {
                            ActivityClient.applyReject(approvalList[i].id);
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
        alist.add(new Divider());
      }
    }
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "我的申请",
                ),
                Tab(
                  text: "我的发布",
                ),
                Tab(text: "我的审批"),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              new ListView(
                children: list,
              ),
              new ListView(
                children: plist,
              ),
              new ListView(
                children: alist,
              ),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
