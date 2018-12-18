import 'package:face_flutter/model/Account.dart';
import 'package:flutter/material.dart';

class ActivityAdd extends StatefulWidget{
  @override
  ActivityAddState createState() {
    return ActivityAddState();
  }
}

class ActivityAddState extends State<ActivityAdd> {
  final _formKey = GlobalKey<FormState>();
  Activity acc= new Activity();

  loadData() async {
//    acc = await new AccountAPI().info();
  }
  String _value = '';
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        locale: Locale('zh'),
        context: context,
        initialDate: new DateTime(2000),
        firstDate: new DateTime(1980),
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
                        hintText: 'title'
                    ),
                    onSaved: (val) {
                      acc.title = val;
                    },
                  ),
                  new TextFormField(
                    maxLength: 10,
                    decoration: new InputDecoration(
                        hintText: 'address'
                    ),
                    onSaved: (val){
                      acc.address=val;
                    },
                  ),
                  new Row(
                    children: <Widget>[
                      new TextFormField(
                        maxLength: 10,
                        decoration: new InputDecoration(
                          hintText: 'stime',
                        ),
                      ),
                      new RaisedButton(onPressed: _selectDate, child: new Text('日期'),),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}