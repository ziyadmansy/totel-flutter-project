import 'package:cheffy/Utils/theme/styles.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String msg;
  final String time;
  const NotificationItem(
      {Key? key,
      required this.image,
      required this.msg,
      required this.time,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        ListTile(
          // leading: ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: Image(
          //     image: image,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: image,
          ),
          title: Text(
            name,
            style: AppStyle.of(context).b4B.wCChineseBlack,
          ),
          subtitle: Text(msg, style: AppStyle.of(context).b5.wCRhythm),
          trailing: Text(time, style: AppStyle.of(context).b6.wCRhythm),
        ),
        // const Divider(),
      ],
    );
  }
}
