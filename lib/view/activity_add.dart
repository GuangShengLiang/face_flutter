import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/model/account.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class ActivityAdd extends StatefulWidget {
  @override
  ActivityAddState createState() {
    return ActivityAddState();
  }
}

class ActivityAddState extends State<ActivityAdd> {
  final Activity act = new Activity();
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

  @override
  Widget build(BuildContext context) {
    List<String> _suppliers = <String>['Apple', 'Google'];
    String _supplier = 'Apple';
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
                if (!_formKey.currentState.validate()) {
                  return;
                }
                _formKey.currentState.save();
                act.detail = "test";
                act.startTime = startDate.toString();
                act.endTime = endDate.toString();
                ActivityClient.add(act);
              },
            ),
          ],
        ),
        body: new Form(
          key: _formKey,
          child: new ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new TextFormField(
                    maxLength: 100,
                    decoration: new InputDecoration(hintText: 'title'),
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
                    format: formats[inputType],
                    editable: editable,
                    validator: (v) {
                      if (v == null) {
                        return 'Please choose time';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'start Time', hasFloatingPlaceholder: false),
                    onChanged: (dt) => setState(() => startDate = dt),
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DateTimePickerFormField(
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
//          Padding(
//              padding: const EdgeInsets.only(bottom: 8.0),
//              child: DropdownButton(
//                  value: _supplier,
//                  items: _suppliers.map((String value) {
//                    return new DropdownMenuItem<String>(
//                      value: value,
//                      child: new Text(value),
//                    );
//                  }).toList(),
//                  onChanged: (v) {
//                    act.type = v;
//                  })),
            ],
          ),
        ));
  }
}
