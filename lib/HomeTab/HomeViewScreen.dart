// import 'package:cheffy/HomeTab/NotificationListScreen.dart';
// import 'package:cheffy/Utils/images,dart.dart';
// import 'package:cheffy/Utils/theme/color.dart';
// import 'package:cheffy/Utils/theme/styles.dart';
// import 'package:cheffy/widgets/app_bar_location_picker.dart';
// import 'package:cheffy/widgets/filters/filterView.dart';
// import 'package:cheffy/widgets/post_listing_item/post_listing_item_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class HomeViewScreen extends StatefulWidget {
//   const HomeViewScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeViewScreenState createState() => _HomeViewScreenState();
// }
//
// class _HomeViewScreenState extends State<HomeViewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         primary: false,
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 16, top: 18, bottom: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     AppBarLocationPicker(
//                         // onTapChangeLocation: viewModel.onTapChangeLocation,
//                         ),
//                     Row(
//                       children: [
//                         OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               shape: const CircleBorder(),
//                               side: BorderSide(color: AppColors.soap),
//                             ),
//                             // onPressed: viewModel.onPressedSearch,
//                             onPressed: () {},
//                             child: const Icon(
//                               Icons.search,
//                               color: Colors.black,
//                             )),
//                         OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             shape: const CircleBorder(),
//                             side: BorderSide(color: AppColors.soap),
//                           ),
//                           // onPressed: viewModel.onPressedNotifications,
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 CupertinoPageRoute(
//                                     builder: (context) =>
//                                         NotificationListScreen()));
//                           },
//                           child: SvgPicture.asset(AppImages.ic_bell,
//                               width: 30, height: 30),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const FilterView(),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'Fit in your choice',
//                   style: AppStyle.of(context).b3.wCChineseBlack,
//                 ),
//               ),
//               Container(
//                 height: 282,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   physics: BouncingScrollPhysics(),
//                   children: [
//                     const SizedBox(width: 8),
//                     PostListingItemView(
//                         layoutType: 1,
//                         image: AssetImage(AppImages.img_ad_1),
//                         dateRange: '4 Jun - 6 Jun',
//                         title: 'Hilton Miami Downtown',
//                         by: 'Albert Flores',
//                         price: '\$90',
//                         period: 'Day',
//                         onTap: () {}
//                         // viewModel.onTapPost(),
//                         ),
//                     PostListingItemView(
//                         layoutType: 1,
//                         image: AssetImage(AppImages.img_ad_2),
//                         dateRange: '4 Jun - 6 Jun',
//                         title: 'Radisson RED Miami Airport',
//                         by: 'Albert Flores',
//                         price: '\$90',
//                         period: 'Day',
//                         onTap: () {}
//                         // viewModel.onTapPost(),
//                         ),
//                     const SizedBox(width: 8),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Traveller in Miami',
//                       style: AppStyle.of(context).b3M,
//                     ),
//                     Text(
//                       '75 Posts',
//                       style: AppStyle.of(context).b6M.wCCrayola,
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   const SizedBox(width: 8),
//                   PostListingItemView(
//                       layoutType: 2,
//                       userImage: AssetImage(AppImages.img_ad_2),
//                       image: AssetImage(AppImages.img_ad_1),
//                       dateRange: '4 Jun - 6 Jun',
//                       title: 'Hilton Miami Downtown',
//                       by: 'Albert Flores',
//                       price: '\$90',
//                       period: 'Day',
//                       onTap: () {} //=> viewModel.onTapPost(),
//                       ),
//                   PostListingItemView(
//                       layoutType: 2,
//                       userImage: AssetImage(AppImages.img_ad_3),
//                       image: AssetImage(AppImages.img_ad_2),
//                       dateRange: '4 Jun - 6 Jun',
//                       title: 'Radisson RED Miami Airport',
//                       by: 'Albert Flores',
//                       price: '\$90',
//                       period: 'Day',
//                       type: 2,
//                       rating: 2,
//                       onTap: () {} //=> viewModel.onTapPost(),
//                       ),
//                   PostListingItemView(
//                       layoutType: 2,
//                       userImage: AssetImage(AppImages.img_ad_3),
//                       image: AssetImage(AppImages.img_ad_2),
//                       dateRange: '4 Jun - 6 Jun',
//                       title: 'Radisson RED Miami Airport',
//                       by: 'Albert Flores',
//                       price: '\$90',
//                       period: 'Day',
//                       type: 3,
//                       onTap: () {} //=> viewModel.onTapPost(),
//                       ),
//                   const SizedBox(width: 8),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
