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
    new AccountClient().myInfo().then((account) {
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
      body: new Form(
        key: _formKey,
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your nick name',
                labelText: 'nick name',
              ),
              onSaved: (val) {
                acc.nickName = val;
              },
            ),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Enter your date of birth',
                labelText: 'birthday',
              ),
              onSaved: (val) {
                acc.birthday = val;
              },
              keyboardType: TextInputType.datetime,
            ),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Enter a email address',
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
