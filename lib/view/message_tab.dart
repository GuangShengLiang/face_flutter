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
  @override
  void initState() {
    super.initState();
    ActivityClient.applyList().then((rst) {
      setState(() {
        applyList = rst;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    if(applyList != null){
      for (var i = 0; i < applyList.length; i++) {
        list.add(
          new ListTile(
            title: new Text(applyList[i].title,
                style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
            subtitle: new Text(applyList[i].statusName),
          ),
        );
        list.add(new Divider());
      }
    }
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "申请列表",),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
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
              Icon(Icons.directions_transit),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

