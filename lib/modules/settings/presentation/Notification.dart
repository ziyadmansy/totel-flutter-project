import 'package:cheffy/Utils/Utils.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool val1 = false, val2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Push Notification',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            trailing: Switch(
              activeColor: Colors.blue,
              value: val1,
              onChanged: (bool v) {
                setState(() {
                  val1 = v;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Chat Notification',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            trailing: Switch(
              activeColor: Colors.blue,
              value: val2,
              onChanged: (bool v) {
                setState(() {
                  val2 = v;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
