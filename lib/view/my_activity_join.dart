import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/common/config.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/activity_add.dart';
import 'package:face_flutter/view/activity_detail.dart';
import 'package:flutter/material.dart';

class ActivityJoinTab extends StatefulWidget {
  @override
  _ActivityTabWidgetState createState() => new _ActivityTabWidgetState();
}

class _ActivityTabWidgetState extends State<ActivityJoinTab> {
  List<Activity> acts;

  @override
  void initState() {
    ActivityClient.myParticipatedList().then((rst) {
      setState(() {
        acts = rst;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(acts ==null){
      return new Container();
    }
    List<Widget> list = new List<Widget>();
    if (acts != null) {
      for (var i = 0; i < acts.length; i++) {
        Activity a = acts[i];
        list.add(new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new ActivityDetail(aid: a.aid)),
            );
          },
          child: new Container(
            height: 80.0,
            color: Colors.white,
            child: new Row(
              // <Widget> is the type of items in the list.
              children: <Widget>[
                new Expanded(
                  child: new Image.asset(
                    'assets/images/01.jpg',
//                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
                new Expanded(
                  flex: 3,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Expanded(
                          child: new Container(
                        padding: const EdgeInsets.all(4.0),
                        child: new Text(
                          a.title,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                      new Expanded(
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: new Text(a.period,
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                        color: Colors.grey,
                                      ))),
                              flex: 2,
                            ),
                            new Expanded(
                              child: new Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: new Text(a.address,
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                        color: Colors.grey,
                                      ))),
                            ),
                            new Expanded(
                              child: new Align(
//                                      alignment: Alignment.bottomRight,
                                child: new Text(a.uname,
                                    style: new TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
        list.add(new Divider(
          height: 4,
        ));
      }
    }
    return new ListView(
      children: list,
    );
  }
}
