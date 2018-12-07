import 'dart:convert';

import 'package:face_flutter/view/mine_edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MineTab extends StatefulWidget {
  @override
  _MineTabWidgetState createState() => new _MineTabWidgetState();
}

class _MineTabWidgetState extends State<MineTab> {
  String name = "";
  String year ="未知";
  String xingzuo = "未知";

  Future<String> makeRequest() async {
    String url = "http://localhost:8690/user/info";
    var response = await http.get(
      Uri.encodeFull(url),
    );
    Map<String, dynamic> user = json.decode(response.body);
    name = user['data']["username"];
  }

  @override
  Widget build(BuildContext context) {
    makeRequest();
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          new Container(
            padding: const EdgeInsets.all(4.0),
            child: new Text( name,
              style: new TextStyle(fontSize: 12, color: Colors.red),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(4.0),
            child: new Text( year,
              style: new TextStyle(
                fontSize: 12,
                color: Colors.orange,
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(4.0),
            color: Colors.blue,
            child: new Text( xingzuo,
              style: new TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ]));
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('我的',
            style: new TextStyle(fontSize: 14.0, color: Colors.white)),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new MineEdit()),
              );
            },
          ),
        ],
      ),
      body: new ListView(
        children: [
          new Image.asset(
            'assets/images/ic_main_tab_company_pre.png',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
        ],
      ),
    );
  }
}
