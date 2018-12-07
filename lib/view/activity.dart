import 'package:face_flutter/view/activity_add.dart';
import 'package:face_flutter/view/activity_detail.dart';
import 'package:flutter/material.dart';

class ActivityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('活动',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Next choice',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new ActivityAdd()),
              );
            },
          ),
        ],
      ),
      body: new ListView(
        children: activityList(context),
      ),
    );
  }

  activityList(BuildContext context) {
    var l = new List<Widget>();
    for (var i = 0; i < 3; i++) {
      l.add(new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new ActivityDetail(aid: i)),
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
                        'Oeschinen Lake Campground' + i.toString(),
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                    new Expanded(
                        flex: 2,
                        child: new Container(
                          padding: const EdgeInsets.all(4.0),
                          child: new Text(
                            'Kandersteg, Switzerland' + i.toString(),
                            style: new TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        )),
                    new Expanded(
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: new Text("亮马桥",
                                    textAlign: TextAlign.left,
                                    style: new TextStyle(
                                      color: Colors.grey,
                                    ))),
                            flex: 3,
                          ),
                          new Expanded(
                            child: new Align(
//                                      alignment: Alignment.bottomRight,
                              child: new Text("张三的局",
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
      l.add(new Divider(
        height: 4,
      ));
    }
    return l;
  }
}