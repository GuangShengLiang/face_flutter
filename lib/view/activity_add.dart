import 'package:face_flutter/api/account_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:flutter/material.dart';

class ActivityAdd extends StatefulWidget{
  @override
  ActivityAddState createState() {
    return ActivityAddState();
  }
}

class ActivityAddState extends State<ActivityAdd> {
  final _formKey = GlobalKey<FormState>();
  final Activity act = new Activity();

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
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('新增活动',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'save',
            onPressed: () {
              _formKey.currentState.save();
              act.detail="test";
              new AccountClient().addActiviy(act);
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
                      act.title = val;
                    },
                  ),
                  new TextFormField(
                    maxLength: 10,
                    decoration: new InputDecoration(
                        hintText: 'address'
                    ),
                    onSaved: (val){
                      act.address=val;
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}