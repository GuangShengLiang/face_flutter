import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/common/config.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/activity_add.dart';
import 'package:face_flutter/view/activity_detail.dart';
import 'package:flutter/material.dart';

class ActivityApplyTab extends StatefulWidget {
  @override
  _ActivityTabWidgetState createState() => new _ActivityTabWidgetState();
}

class _ActivityTabWidgetState extends State<ActivityApplyTab> {
  List<Apply> applyList;

  @override
  void initState() {
    ActivityClient.applyList().then((rst) {
      setState(() {
        applyList = rst;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    if (applyList != null) {
      for (var i = 0; i < applyList.length; i++) {
        if (applyList[i].status == Config.apply_status_agree
            || applyList[i].status == Config.apply_status_cancel
            || applyList[i].status == Config.apply_status_reject) {
          list.add(
              Container(
                height: 40,
                child: new Row(children: <Widget>[
                  new Expanded(child: new Text(applyList[i].title),),
                  new Expanded(child: new Text(applyList[i].statusName))
                ],)
                ,)
          );
        } else {
          list.add(
              new Row(children: <Widget>[
                new Expanded(child: new Text(applyList[i].title),),
                new Expanded(
                  child: new RaisedButton(child: new Text("取消"), onPressed: () {
                    ActivityClient.applyCancle(applyList[i].id);
                  }),)
              ],)
          );
        }
        list.add(new Divider());
      }
    }
    return new ListView(children: list,);
  }
}

