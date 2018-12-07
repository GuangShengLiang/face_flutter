import 'package:flutter/material.dart';

class MineEdit extends StatelessWidget {

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
//              Navigator.pop(context);
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
          MyCustomForm()
        ],
      ),
    );
  }
}
// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new TextFormField(
              maxLength: 10,
              decoration: new InputDecoration(
                  hintText: '昵称'
              ),
            ),
            new TextFormField(
              maxLength: 10,
              decoration: new InputDecoration(
                  hintText: '生日'
              ),
            ),
            new TextFormField(
              maxLength: 10,
              decoration: new InputDecoration(
                  hintText: '职业'
              ),
            ),
          ],
        ));
  }
}