import 'package:flutter/material.dart';

class ActivityDetail extends StatelessWidget {
  final int aid;
  String address = "亮马桥";
  String period = '2018-11-10 10:00--2018-11-10 13:00';
  String partner = "张三，李四";

  ActivityDetail({Key key, @required this.aid}):super(key:key);


  @override
  Widget build(BuildContext context) {
    Widget title= new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
            children: [
              new Container(
                padding: const EdgeInsets.all(2.0),
                child: new Text(address,
                  style: new TextStyle(
                      fontSize: 14,
                      color: Colors.red
                  ),
                ),
              ),
            ]
        )
    );
    Widget time = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
            children: [
              new Container(
                padding: const EdgeInsets.all(2.0),
                color: Colors.orange,
                child: new Text(period,
                  style: new TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ]
        )
    );
    Widget person = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.all(2.0),
                child: new Text(partner,
                  style: new TextStyle(
                      fontSize: 14,
                      color: Colors.red
                  ),
                ),
              ),
            ]
        )
    );
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(),
      floatingActionButton: new FlatButton(
        child: new Text("报名",),
        color: Colors.blue,

        onPressed: () => {},
      ),
//      bottomNavigationBar: new BottomAppBar(
//        color: Colors.grey,
//        child: new Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            IconButton(icon: Icon(Icons.menu), onPressed: () {},),
//            IconButton(icon: Icon(Icons.search), onPressed: () {},),
//          ],
//        ),
//      ),
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
}
