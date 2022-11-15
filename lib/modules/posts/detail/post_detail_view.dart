import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/widgets/main_app_bar.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/modules/widgets/carousel/carousel_view.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'post_detail_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 15,
  );

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        // final postDetailProvider = context.read<PostDetailViewModel>();
        // final NavigationService _navigationService = locator.get();
        // print(_navigationService.currentArguments);
        // postDetailProvider.init();
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final postDetailProvider = context.watch<PostDetailViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: AppBarActionButton(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              postDetailProvider.onPressedBack();
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
            initialCameraPosition: PostDetailView._kGooglePlex,
            onMapCreated: postDetailProvider.onMapCreated,
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
                                style: AppStyle.of(context).b4M.wCChineseBlack),
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
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Text(
                                "4 Jun - 6 Jun",
                                style: AppStyle.of(context).b4M.wCChineseBlack,
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
                          image: R.svg.ic_marker_outline(width: 22, height: 22),
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
                              style: AppStyle.of(context).b4M.wCChineseBlack,
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
                              style: AppStyle.of(context).b4B.wCChineseBlack,
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
                        postDetailProvider.onTapBookNow();
                      },
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
