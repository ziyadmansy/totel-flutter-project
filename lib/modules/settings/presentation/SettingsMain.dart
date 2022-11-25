import 'package:cheffy/modules/settings/presentation/ChangePassword.dart';
import 'package:cheffy/modules/settings/presentation/Notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMainScreen extends StatelessWidget {
  final List<String> _settingsList = [
    'Notifications',
    'Change Password',
  ];
  final List<Widget> settingsScreens = [
    NotificationScreen(),
    ChangePasswordScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.separated(
        itemCount: _settingsList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            _settingsList[index],
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 15,
          ),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => settingsScreens[index],
              ),
            );
          },
        ),
        separatorBuilder: (context, i) => Divider(),
      ),
    );
  }
}
