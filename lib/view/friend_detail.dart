import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/api/constant.dart';
import 'package:face_flutter/model/account.dart';
import 'package:flutter/material.dart';


class FriendDetail extends StatefulWidget {
  final String ruid;
  FriendDetail({Key key, @required this.ruid}) : super(key: key);
  @override
  _FriendDetailState createState() => new _FriendDetailState(ruid:ruid);
}

class _FriendDetailState extends State<FriendDetail> {
  Account acc;
  Relation relation;
  String ruid;
  String buttonText = "添加到通讯录";

  _FriendDetailState({Key key, @required this.ruid});

  @override
  void initState() {
    super.initState();
    AccountClient().info(ruid).then((rst) {
      setState(() {
        acc = rst;
      });
    });
    AccountClient().relation(ruid).then((rst) {
      setState(() {
        relation = rst;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if (acc == null) {
      return new Container();
    }
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Text(acc.nickName,
                  style: new TextStyle(
                      fontSize: 12,
                      color: Colors.red
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Text(acc.year,
                  style: new TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.blue,
                child: new Text(acc.constellation,
                  style: new TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ]
        )
    );
    if (relation != null){
      if (relation.type == constant.relation_type_black){
        buttonText = "";
      }else if(relation.type == constant.relation_type_friend){
        buttonText = "";
      }
    }
    Widget action = new Container(
      child: new FlatButton(
          child: new Text(
            buttonText,
          ),
          onPressed: _getBtnClickListener(),
      ),
    );
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(acc.nickName,
            style: new TextStyle(fontSize: 14.0, color: Colors.white)),
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
          action,
        ],
      ),
    );
  }

  _getBtnClickListener() {
    if (buttonText == "") {
      return null;
    } else {
      return () {
        AccountClient().friendRequest(ruid);
      };
    }
  }
}
