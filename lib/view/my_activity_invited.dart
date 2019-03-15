import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/common/config.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/activity_add.dart';
import 'package:face_flutter/view/activity_detail.dart';
import 'package:flutter/material.dart';

class ActivityInvitedTab extends StatefulWidget {
  @override
  _ActivityTabWidgetState createState() => new _ActivityTabWidgetState();
}

class _ActivityTabWidgetState extends State<ActivityInvitedTab> {
  List<Invite> rst;

  @override
  void initState() {
    ActivityClient.invitedList().then((t) {
      setState(() {
        rst = t;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    if (rst != null) {
      for (var i = 0; i < rst.length; i++) {
        list.add(
          new Container(
            child: new Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: new Column(
                    children: <Widget>[
                      new Text(rst[i].title),
                      new Text(rst[i].statusName)
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
                            ActivityClient.applyAgree(rst[i].id);
                          },
                        ),
                        new FlatButton(
                          child: Text("拒绝"),
                          onPressed: () {
                            ActivityClient.applyReject(rst[i].id);
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
        list.add(new Divider());
      }
      return new ListView(children: list,);
    }
  }
}
