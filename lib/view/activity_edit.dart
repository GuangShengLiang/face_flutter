import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityEdit extends StatefulWidget {
  final String aid;
  ActivityEdit({Key key, @required this.aid}) : super(key: key);
  @override
  ActivityAddState createState() {
    return ActivityAddState(aid: aid);
  }
}

class ActivityAddState extends State<ActivityEdit> {
  final String aid;
  Activity act;
  final _formKey = GlobalKey<FormState>();
  final formats = {
    InputType.both: DateFormat("yyyy-MM-dd HH:mm"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };
  InputType inputType = InputType.both;
  bool editable = false;
  DateTime startDate;
  DateTime endDate;

  ActivityAddState({Key key, @required this.aid});
  @override
  void initState() {
    super.initState();
    ActivityClient.detail(aid).then((rst) {
      setState(() {
        act = rst;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (act == null) {
      return new Container();
    }

    return new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text('编辑活动',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.save),
              tooltip: 'save',
              onPressed: () {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                _formKey.currentState.save();
                act.detail = "test";
                act.startTime = startDate.toString();
                act.endTime = endDate.toString();
                ActivityClient.edit(act);
              },
            ),
          ],
        ),
        body: new Form(
            key: _formKey,
            child: new ListView(children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new TextFormField(
                    maxLength: 100,
                    decoration: new InputDecoration(hintText: 'title'),
                    initialValue: act.title,
                    validator: (v) {
                      if (v.isEmpty) {
                        return 'Please enter text';
                      }
                    },
                    onSaved: (v) => act.title = v,
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new TextFormField(
                    maxLength: 100,
                    initialValue: act.address,
                    decoration: new InputDecoration(hintText: 'address'),
                    validator: (v) {
                      if (v.isEmpty) {
                        return 'Please enter text';
                      }
                    },
                    onSaved: (v) => act.address = v,
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new TextFormField(
                    maxLength: 100,
                    initialValue: act.detail,
                    decoration: new InputDecoration(
                      hintText: 'detail',
                    ),
                    validator: (v) {
                      if (v.isEmpty) {
                        return 'Please enter text';
                      }
                    },
                    onSaved: (v) => act.detail = v,
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DateTimePickerFormField(
                    inputType: inputType,
//                    initialValue: DateTime.parse(act.startTime),
                    format: formats[inputType],
                    editable: editable,
                    decoration: InputDecoration(
                        labelText: 'start Time', hasFloatingPlaceholder: false),
                    validator: (v) {
                      if (v == null) {
                        return 'Please choose time';
                      }
                    },
                    onChanged: (dt) => setState(() => startDate = dt),
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DateTimePickerFormField(
//                    initialValue: DateTime.parse(act.endTime),
                    inputType: inputType,
                    format: formats[inputType],
                    editable: editable,
                    validator: (v) {
                      if (v == null) {
                        return 'Please choose time';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'end Time', hasFloatingPlaceholder: false),
                    onChanged: (dt) => setState(() => endDate = dt),
                  ))
            ])));
  }
}
