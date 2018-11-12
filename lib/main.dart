import 'package:face_flutter/MyHomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  title: 'Flutter Tutorial', // used by the OS task switcher
  home: new MyHomePage(),
));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}

