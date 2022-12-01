import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/widgets/drawer_header.dart';
import 'package:cheffy/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class AppDrawer extends ViewModelWidget<MainViewModel> {
  @override
  Widget build(BuildContext context, MainViewModel mainViewModel) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeaderWidget(),
          DrawerItem(
            title: 'My bookings',
            icon: FontAwesomeIcons.hotel,
            onPress: mainViewModel.onDrawerItemPressedBookings,
          ),
          Divider(),
          DrawerItem(
            title: 'Help',
            icon: FontAwesomeIcons.solidCircleQuestion,
            onPress: mainViewModel.onDrawerItemPressedHelp,
          ),
          DrawerItem(
            title: 'About',
            icon: FontAwesomeIcons.circleInfo,
            onPress: mainViewModel.onDrawerItemPressedAbout,
          ),
          // DrawerItem(
          //   title: 'Settings',
          //   icon: FontAwesomeIcons.gear,
          //   onPress: mainViewModel.onDrawerItemPressedSettings,
          // ),
          Divider(),
          DrawerItem(
            title: 'Logout',
            icon: FontAwesomeIcons.arrowRightFromBracket,
            onPress: () async {
              await mainViewModel.logout();
            },
          ),
        ],
      ),
    );
  }
}
