// import 'package:cheffy/HomeTab/HomeViewScreen.dart';
// import 'package:cheffy/HomeTab/Location/SetCurrentLocationScreenMapView.dart';
// import 'package:cheffy/HomeTab/Location/SetYourLocationScreen.dart';
// import 'package:cheffy/Chats/ChatsList.dart';
// import 'package:cheffy/MapTab/MapTabScreen.dart';
// import 'package:cheffy/ProfilesTab/SettingsMain.dart';
// import 'package:cheffy/Utils/images,dart.dart';
// import 'package:cheffy/Utils/theme/color.dart';
// import 'package:flutter/material.dart';
// // import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedPage = 0;
//   final _pageOptions = [
//     HomeViewScreen(),
//     MapTabScreen(),
//     HomeViewScreen(),
//     HomeViewScreen(),
//     ChatsList(),
//     // SettingsMainScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pageOptions[_selectedPage],
//       backgroundColor: Colors.white,
//       bottomNavigationBar: BottomNavigationBar(
//         unselectedItemColor: Colors.black,
//         selectedItemColor: Colors.blue,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         selectedLabelStyle: TextStyle(
//             color: AppColors.plumpPurplePrimary, fontWeight: FontWeight.w700),
//         unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         elevation: 5,
//         currentIndex: _selectedPage,
//         onTap: (val) {
//           setState(() {
//             _selectedPage = val;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Image.asset(AppImages.ic_home),
//             activeIcon: SvgPicture.asset(AppImages.ic_home_active),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppImages.ic_map),
//             activeIcon: SvgPicture.asset(AppImages.ic_map_active),
//             label: 'Map',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppImages.ic_add),
//             activeIcon: SvgPicture.asset(AppImages.ic_add),
//             label: 'Add',
//
//             // title: Text('Add'),
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppImages.ic_post),
//             activeIcon: SvgPicture.asset(AppImages.ic_post_active),
//             label: 'Post',
//
//             // title: Text('Post'),
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppImages.ic_chat),
//             activeIcon: SvgPicture.asset(AppImages.ic_chat_active),
//             label: 'Chat',
//
//             // title: Text('Chat'),
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(
//           //       _selectedPage == 5 ? Icons.settings : Icons.settings_outlined),
//           //   label: 'Settings',
//           //
//           //   // title: Text('Settings'),
//           // ),
//         ],
//       ),
//       drawer: Drawer(),
//     );
//   }
// }
