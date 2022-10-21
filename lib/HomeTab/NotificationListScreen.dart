import 'package:cheffy/HomeTab/NotificationItem.dart';
import 'package:cheffy/Utils/images,dart.dart';
import 'package:flutter/material.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({Key? key}) : super(key: key);

  @override
  _NotificationListScreenState createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Your Notifications',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          NotificationItem(
            image: AssetImage(AppImages.img_avatar_2),
            name: 'Wade Warren',
            msg: 'Sent request to stay with you',
            time: '21 min ago',
          ),
          NotificationItem(
            image: AssetImage(AppImages.img_ad_2),
            name: 'Your Post is live',
            msg: 'Sent request to stay with you',
            time: '21/07/2021',
          ),
          Divider(),
        ],
      ),
    ));
  }
}
