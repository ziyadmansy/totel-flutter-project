import 'package:cheffy/Utils/theme/styles.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String name;
  final String msg;
  final String time;
  const NotificationItem(
      {Key? key, this.msg = '', required this.time, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: AppStyle.of(context).b4B.wCChineseBlack,
      ),
      subtitle: Text(msg, style: AppStyle.of(context).b5.wCRhythm),
      trailing: Text(time, style: AppStyle.of(context).b6.wCRhythm),
    );
  }
}
