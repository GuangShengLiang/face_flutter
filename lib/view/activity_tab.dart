import 'package:face_flutter/api/activity_client.dart';
import 'package:face_flutter/common/config.dart';
import 'package:face_flutter/model/account.dart';
import 'package:face_flutter/view/my_activity_apply.dart';
import 'package:face_flutter/view/my_activity_approval.dart';
import 'package:face_flutter/view/my_activity_invite.dart';
import 'package:face_flutter/view/my_activity_invited.dart';
import 'package:face_flutter/view/my_activity_join.dart';
import 'package:face_flutter/view/my_activity_wait_join.dart';
import 'package:flutter/material.dart';

class MyActivityTab extends StatelessWidget {
  int initialIndex = 0;

  MyActivityTab({Key key, @required this.initialIndex}) : super(key: key);

//  @override
//  ActivityAddState createState() =>
//      new ActivityAddState(initialIndex: initialIndex);
//}

//class ActivityAddState extends State<MyActivityTab> {
//  int initialIndex;
//  ActivityAddState({Key key, @required this.initialIndex});
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = new List();
    Config.act_button_list.asMap().forEach((i, v) {
      tabs.add(Tab(text: v,));
    });
      return DefaultTabController(
      length: Config.act_button_list.length,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabs,
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            ActivityWaitJoinTab(),
            ActivityApplyTab(),
            ActivityInvitedTab(),
            ActivityApprovalTab(),
            ActivityInviteTab(),
            ActivityJoinTab(),
          ],
        ),
      ),
    );
  }
}
