import 'package:face_flutter/api/AccountClient.dart';
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

  String _value = '';
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        locale: Locale('zh'),
        context: context,
        initialDate: new DateTime(2000),
        firstDate: new DateTime(1980),
        lastDate: new DateTime(2019));
    if (picked != null) setState(() => _value = picked.toString());
  }

  @override
  void initState() {
    super.initState();
    new AccountClient().info().then((account) {
      setState(() {
        acc = account;
      });
    });
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
              new AccountClient().updateInfo(acc.nickName);
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
              child: new Container(
                child: new Column(
                    children: <Widget>[
                  new TextFormField(
                    maxLength: 10,
                    decoration: new InputDecoration(
                        labelText: "昵称",
                        labelStyle: new TextStyle(fontSize: 18)),
                    initialValue: acc.nickName,
                    onSaved: (val) {
                      acc.nickName = val;
                    },
                  ),
                  new Container(
                    child:
                    new Row(
                      children: <Widget>[
                        new TextFormField(
                          maxLength: 10,
                          initialValue: _value,
                          decoration: new InputDecoration(
                            hintText: '生日',
                          ),
                        ),
//                        new IconButton(
//                            icon: new Icon(Icons.date_range), onPressed: null)
                      ],
                    ),
                  ),
                  new TextFormField(
                    maxLength: 10,
                    decoration: new InputDecoration(hintText: '职业'),
                  ),
                ],
              )),
          )
        ],
      ),
    );
  }
}
