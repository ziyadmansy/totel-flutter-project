import 'package:cheffy/modules/widgets/main_app_bar.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/modules/widgets/carousel/carousel_view.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';

import 'post_detail_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';

//BIDDING SCREEN
class PostDetailView extends ViewModelBuilderWidget<PostDetailViewModel> {
  const PostDetailView({super.key});

  Widget requiredQuestion(String title, List<Icon> icons,
      List<dynamic> conditions, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.of(context).b2M.wCChineseBlack),
        SizedBox(height: 10),
        for (int i = 0; i < conditions.length; i++)
          ListTile(
            leading: icons[i],
            title: Text(
              conditions[i],
              style: AppStyle.of(context).b4.wCChineseBlack,
            ),
            dense: true,
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 10,
          ),
        //List view builder is giving the extra space. So removed this.
        // Container(
        //   color: Colors.white,
        //   child: ListView.builder(
        //
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemCount: conditions.length,
        //     itemBuilder: (context, index) => ListTile(
        //       leading: icons[index],
        //       title: Text(
        //         conditions[index],
        //         style: AppStyle.of(context).b4.wCChineseBlack,
        //       ),
        //       dense: true,
        //       contentPadding: EdgeInsets.zero,
        //       minLeadingWidth: 10,
        //     ),
        //   ),
        // ),
        SizedBox(height: 10),
        Divider()
      ],
    );
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget builder(
      BuildContext context, PostDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: AppBarActionButton(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.onPressedBack();
            },
          ),
        ),
        actions: [
          AppBarActionButton(
            child: Image(
              image: R.svg.ic_bookmark(width: 11, height: 16),
            ),
          ),
          AppBarActionButton(
            child: Image(
              image: R.svg.ic_share(width: 20, height: 20),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: viewModel.onMapCreated,
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.4,
              builder: (context, ScrollController sc) {
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView(
                      // mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      shrinkWrap: true,
                      controller: sc,
                      children: [
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 120),
                          child: Divider(thickness: 3),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: R.image.img_ad_1(),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 120,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Hilton",
                                    style: AppStyle.of(context)
                                        .b4M
                                        .wCChineseBlack),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      "4.9",
                                      style: AppStyle.of(context).b5.wCRhythm,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "200 Reviews",
                                      style: AppStyle.of(context).b5.wCRhythm,
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  child: Text(
                                    "4 Jun - 6 Jun",
                                    style:
                                        AppStyle.of(context).b4M.wCChineseBlack,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: R.svg
                                  .ic_marker_outline(width: 22, height: 22),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                '1601 Biscayne Bivd, Miami, FL 33132, United States',
                                style: AppStyle.of(context).b5.wCRhythm,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        //Partner
                        SizedBox(height: 10),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: R.image.img_ad_1(),
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tony Blair",
                                  style:
                                      AppStyle.of(context).b4M.wCChineseBlack,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Partner",
                                  style: AppStyle.of(context).b5.wCRhythm,
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ending in",
                                  style: AppStyle.of(context).b5.wCRhythm,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "28 : 32 : 12",
                                  style:
                                      AppStyle.of(context).b4B.wCChineseBlack,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        //Description
                        Text(
                          'Description',
                          style: AppStyle.of(context).b2M.wCChineseBlack,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                          style: AppStyle.of(context).b5.wCRhythm,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        requiredQuestion(
                            'What does this place have for you?',
                            [
                              Icon(Icons.kitchen_sharp),
                              Icon(Icons.wifi),
                              Icon(Icons.bed_sharp),
                              Icon(Icons.home_work_sharp),
                              Icon(Icons.local_parking),
                              Icon(Icons.pool_sharp)
                            ],
                            [
                              'Kitchen',
                              'Wi-fi',
                              'Bed Reserver',
                              'Space to work',
                              'Parking card',
                              'Swimming pool'
                            ],
                            context),
                        SizedBox(
                          height: 10,
                        ),
                        requiredQuestion(
                            'What you are allowed?',
                            [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            ],
                            ['Bring a pet'],
                            context),
                        SizedBox(
                          height: 10,
                        ),
                        requiredQuestion(
                            'What you are not allowed?',
                            [
                              Icon(Icons.clear_rounded, color: Colors.red),
                              Icon(Icons.clear_rounded, color: Colors.red),
                              Icon(Icons.clear_rounded, color: Colors.red),
                            ],
                            [
                              "Don't get drunk",
                              "Do not use drugs and stimulants",
                              "Don't bring strangers to my room"
                            ],
                            context),
                        SharedWidgets.buildRoundedElevatedButton(
                          btnChild: Text('Book now'),
                          onPress: () {
                            viewModel.onTapBookNow();
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SharedWidgets.buildRoundedOutlinedButton(
                          btnChild: Text('Be a partner'),
                          onPress: () {},
                        ),
                        SizedBox(height: 80),
                      ],
                    ));
              }),
          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     // height: 80,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.grey.shade100),
          //       color: Colors.white,
          //     ),
          //     width: MediaQuery.of(context).size.width,
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 18.0),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text('Highest Bid',
          //                   style: AppStyle.of(context).b5.wCRhythm),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Text("\$75.00",
          //                   style: AppStyle.of(context).b4B.wCChineseBlack)
          //             ],
          //           ),
          //           ElevatedButton(
          //             child: Text('Place a Bid',
          //                 style: AppStyle.of(context).b5.wCWhite),
          //             onPressed: () {
          //               viewModel.onTapPost();
          //             },
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );

    //   Material(
    //   child: Column(
    //     children: [
    //       Expanded(
    //         child: CustomScrollView(
    //           slivers: [
    //             SliverAppBar(
    //               pinned: true,
    //               backgroundColor: Theme.of(context).colorScheme.background,
    //               leading: const AppBarActionButton(),
    //               expandedHeight: 400,
    //               actions: [
    //                 AppBarActionButton(
    //                   child: Image(
    //                     image: R.svg.ic_bookmark(width: 11, height: 16),
    //                   ),
    //                 ),
    //                 AppBarActionButton(
    //                   child: Image(
    //                     image: R.svg.ic_share(width: 20, height: 20),
    //                   ),
    //                 ),
    //               ],
    //               flexibleSpace: GoogleMap(
    //                 initialCameraPosition: _kGooglePlex,
    //                 onMapCreated: viewModel.onMapCreated,
    //               ),
    //
    //               // Stack(
    //               //   children: [
    //               //     FlexibleSpaceBar(
    //               //       background: CarouselView(
    //               //         itemCount: 3,
    //               //         bottomMargin: 16,
    //               //         itemBuilder: (context, index) => Image(
    //               //           image: R.image.img_ad_1(),
    //               //           fit: BoxFit.cover,
    //               //         ),
    //               //       ),
    //               //     ),
    //               //     Positioned(
    //               //       left: 0,
    //               //       right: 0,
    //               //       height: 16,
    //               //       bottom: -4,
    //               //       child: Container(
    //               //         decoration: BoxDecoration(
    //               //           color: Theme.of(context).colorScheme.background,
    //               //           borderRadius: const BorderRadius.only(
    //               //             topLeft: Radius.circular(20),
    //               //             topRight: Radius.circular(20),
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //   ],
    //               // ),
    //             ),
    //             // SliverPadding(
    //             //   padding:
    //             //       const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    //             //   sliver: // Container(
    //             //           //   padding: const EdgeInsets.all(16),
    //             //           //   decoration: BoxDecoration(
    //             //           //     color: Colors.white,
    //             //           //     boxShadow: [
    //             //           //       BoxShadow(
    //             //           //         offset: const Offset(0, 2),
    //             //           //         blurRadius: 12,
    //             //           //         color: Theme.of(context).colorScheme.shadow,
    //             //           //       ),
    //             //           //     ],
    //             //           //   ),
    //             //           //   child: Row(
    //             //           //     children: [
    //             //           //       Expanded(
    //             //           //         child: OutlinedButton(
    //             //           //           onPressed: viewModel.onRequest,
    //             //           //           child: Text(viewModel.isRequested ? 'Pay' : 'Request'),
    //             //           //         ),
    //             //           //       ),
    //             //           //       const SizedBox(width: 16),
    //             //           //       Expanded(
    //             //           //         child: ElevatedButton(
    //             //           //           onPressed: viewModel.onSendMessage,
    //             //           //           child: Row(
    //             //           //             children: [
    //             //           //               Image(
    //             //           //                 image: R.svg.ic_chat(width: 18, height: 17),
    //             //           //                 color: Colors.white,
    //             //           //               ),
    //             //           //               const SizedBox(width: 8),
    //             //           //               const Text('Send Message'),
    //             //           //             ],
    //             //           //           ),
    //             //           //         ),
    //             //           //       ),
    //             //           //     ],
    //             //           //   ),
    //             //           // ),
    //             // ),
    //           ],
    //         ),
    //       ),
    //
    //     ],
    //   ),
    // );
  }

  @override
  PostDetailViewModel viewModelBuilder(BuildContext context) =>
      PostDetailViewModel();
}
// expandableContent: Container(
//     color: Colors.white,
//     height: 500,
//     child: Expanded(
//         child: ListView(
//       padding: EdgeInsets.symmetric(horizontal: 18),
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             //Description
//             Text(
//               'Description',
//               style: AppStyle.of(context).b2M.wCChineseBlack,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
//               style: AppStyle.of(context).b5.wCRhythm,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Divider(),
//             requiredQuestion(
//                 'What does this place have for you?',
//                 [
//                   Icons.kitchen_sharp,
//                   Icons.wifi,
//                   Icons.bed_sharp,
//                   Icons.home_work_sharp,
//                   Icons.local_parking,
//                   Icons.pool_sharp
//                 ],
//                 [
//                   'Kitchen',
//                   'Wi-fi',
//                   'Bed Reserver',
//                   'Space to work',
//                   'Parking card',
//                   'Swimming pool'
//                 ],
//                 context),
//             SizedBox(
//               height: 10,
//             ),
//             requiredQuestion('What you are allowed?',
//                 [Icons.pool_sharp], ['Bring'], context),
//             SizedBox(
//               height: 10,
//             ),
//             requiredQuestion(
//                 'What you are not allowed?',
//                 [
//                   Icons.clear,
//                   Icons.clear,
//                   Icons.clear,
//                 ],
//                 [
//                   "Don't get drunk",
//                   "Do not use drugs and stimulants",
//                   "Don't bring strangers to my room"
//                 ],
//                 context),
//             Divider(),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Text('Highest Bid',
//                         style: AppStyle.of(context).b5.wCRhythm),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text("\$75.00",
//                         style: AppStyle.of(context).b4.wCChineseBlack)
//                   ],
//                 ),
//                 ElevatedButton(
//                   child: Text('Place a Bid',
//                       style: AppStyle.of(context).b5.wCWhite),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Text(
//             //       DateTime.now().format('MMMM dd, yyyy'),
//             //       style: AppStyle.of(context).b5.wCRhythm,
//             //     ),
//             //     Chip(
//             //       padding:
//             //           const EdgeInsets.symmetric(horizontal: 8),
//             //       backgroundColor: AppColors.pastelRedSecondary,
//             //       label: Text(
//             //         'Female only',
//             //         style: AppStyle.of(context).b5M.wCWhite,
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // const SizedBox(height: 8),
//             // Text(
//             //   'The Zuri White Sands Goa Resort and Casino',
//             //   style: AppStyle.of(context).b2M,
//             // ),
//             // const SizedBox(height: 8),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Row(
//             //       mainAxisAlignment: MainAxisAlignment.start,
//             //       crossAxisAlignment: CrossAxisAlignment.center,
//             //       children: [
//             //         Image(
//             //           image: R.svg.ic_marker_outline(
//             //             width: 22,
//             //             height: 22,
//             //           ),
//             //         ),
//             //         const SizedBox(width: 4),
//             //         Text(
//             //           'Miami, FL 33132',
//             //           style: AppStyle.of(context).b4.wCRhythm,
//             //         ),
//             //         const SizedBox(width: 4),
//             //         Transform.rotate(
//             //           angle: 15,
//             //           child: Icon(
//             //             Icons.arrow_back,
//             //             color: AppColors.chineseBlack,
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //     Chip(
//             //       padding:
//             //           const EdgeInsets.symmetric(horizontal: 8),
//             //       side: BorderSide(color: AppColors.soap),
//             //       backgroundColor:
//             //           Theme.of(context).colorScheme.background,
//             //       avatar: Icon(
//             //         Icons.star_rounded,
//             //         color: AppColors.pastelRedSecondary,
//             //       ),
//             //       label: Text(
//             //         '4.0',
//             //         style: AppStyle.of(context).b4M,
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // const SizedBox(height: 8),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   crossAxisAlignment: CrossAxisAlignment.baseline,
//             //   textBaseline: TextBaseline.ideographic,
//             //   children: [
//             //     Chip(
//             //       label: Text(
//             //         '4 Jun - 6 Jun',
//             //         style: AppStyle.of(context).b5M.wCChineseBlack,
//             //       ),
//             //       side: BorderSide(color: AppColors.soap),
//             //       backgroundColor:
//             //           Theme.of(context).colorScheme.background,
//             //     ),
//             //     Row(
//             //       mainAxisSize: MainAxisSize.min,
//             //       mainAxisAlignment: MainAxisAlignment.start,
//             //       crossAxisAlignment: CrossAxisAlignment.baseline,
//             //       textBaseline: TextBaseline.ideographic,
//             //       children: [
//             //         Text(
//             //           '\$100',
//             //           maxLines: 1,
//             //           overflow: TextOverflow.ellipsis,
//             //           style:
//             //               AppStyle.of(context).b3M.wCChineseBlack,
//             //         ),
//             //         const SizedBox(width: 4),
//             //         Text(
//             //           '/ Day',
//             //           maxLines: 1,
//             //           overflow: TextOverflow.ellipsis,
//             //           style: AppStyle.of(context).b5.wCChineseBlack,
//             //         ),
//             //       ],
//             //     ),
//             //   ],
//             // ),
//             // const SizedBox(height: 8),
//             // const Divider(),
//             // const SizedBox(height: 8),
//             // Text('Details', style: AppStyle.of(context).b3M),
//             // const SizedBox(height: 8),
//             // Text(
//             //   'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
//             //   style: AppStyle.of(context).b4.wCRhythm,
//             // ),
//             // const SizedBox(height: 8),
//             // Container(
//             //   padding: const EdgeInsets.all(12.0),
//             //   decoration: BoxDecoration(
//             //       color: Colors.white,
//             //       border: Border.all(color: AppColors.soap),
//             //       borderRadius: BorderRadius.circular(20)),
//             //   child: Row(
//             //     mainAxisSize: MainAxisSize.max,
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     crossAxisAlignment: CrossAxisAlignment.center,
//             //     children: [
//             //       Expanded(
//             //         child: Row(
//             //           mainAxisSize: MainAxisSize.min,
//             //           mainAxisAlignment: MainAxisAlignment.start,
//             //           crossAxisAlignment: CrossAxisAlignment.center,
//             //           children: [
//             //             CircleAvatar(
//             //               backgroundImage: R.image.img_avatar_2(),
//             //               backgroundColor: Theme.of(context)
//             //                   .colorScheme
//             //                   .secondary,
//             //               radius: 24,
//             //             ),
//             //             const SizedBox(width: 12),
//             //             Column(
//             //               crossAxisAlignment:
//             //                   CrossAxisAlignment.start,
//             //               children: [
//             //                 Text(
//             //                   'Albert Flores',
//             //                   style: AppStyle.of(context)
//             //                       .b4M
//             //                       .wCChineseBlack,
//             //                 ),
//             //                 Text(
//             //                   'Doctor',
//             //                   style:
//             //                       AppStyle.of(context).b6.wCCrayola,
//             //                 ),
//             //               ],
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       Chip(
//             //         label: Text(
//             //           '3.0',
//             //           style: AppStyle.of(context).b5M.wCWhite,
//             //         ),
//             //         avatar: Image(
//             //           image: R.svg
//             //               .ic_user_filled(width: 14, height: 14),
//             //         ),
//             //         backgroundColor: AppColors.ratingNormal,
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             // const SizedBox(height: 16),
//             // Text(
//             //   'Similar',
//             //   style: AppStyle.of(context).b3M,
//             // ),
//             // SizedBox(
//             //   height: 282,
//             //   child: ListView(
//             //     scrollDirection: Axis.horizontal,
//             //     children: [
//             //       PostListingItemView(
//             //         layoutType: 1,
//             //         image: R.image.img_ad_1(),
//             //         dateRange: '4 Jun - 6 Jun',
//             //         title: 'Hilton Miami Downtown',
//             //         by: 'Albert Flores',
//             //         price: '\$90',
//             //         period: 'Day',
//             //         onTap: () => viewModel.onTapPost(),
//             //       ),
//             //       PostListingItemView(
//             //         layoutType: 1,
//             //         image: R.image.img_ad_2(),
//             //         dateRange: '4 Jun - 6 Jun',
//             //         title: 'Radisson RED Miami Airport',
//             //         by: 'Albert Flores',
//             //         price: '\$90',
//             //         period: 'Day',
//             //         onTap: () => viewModel.onTapPost(),
//             //       ),
//             //       const SizedBox(width: 8),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ],
//     )))
