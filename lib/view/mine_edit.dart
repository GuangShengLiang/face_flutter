import 'package:face_flutter/api/AccountAPI.dart';
import 'package:face_flutter/model/Account.dart';
import 'package:flutter/material.dart';

class MineEdit extends StatefulWidget {
  @override
  MineEditState createState() {
    return MineEditState();
  }
}

class MineEditState extends State<MineEdit> {
  final _formKey = GlobalKey<FormState>();
  Account acc;

  loadData() async {
    acc = await new AccountAPI().info();
  }
  String _value = '';
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        locale: Locale('zh'),
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019)
    );
    if(picked != null) setState(() => _value = picked.toString());
  }

  @override
  Future initState() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('profile',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'save',
            onPressed: () {
              _formKey.currentState.save();
              new AccountAPI().updateInfo(acc.nickName);
              print("saved");
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
          new Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    maxLength: 10,
                    decoration: new InputDecoration(
                        hintText: '昵称'
                    ),
                    onSaved: (val) {
                      acc.nickName = val;
                    },
                  ),
                  new TextFormField(
                    maxLength: 10,
                    decoration: new InputDecoration(
                        hintText: '生日'
                    ),
                  ),
                  new RaisedButton(onPressed: _selectDate, child: new Text('Click me'),),
                  new TextFormField(
                    maxLength: 10,
                    decoration: new InputDecoration(
                        hintText: '职业'
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}