import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/share_room_post_entity.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';

import 'post_detail_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostShareRoomDetailView extends StatefulWidget {
  final ShareRoomPost post;
  const PostShareRoomDetailView({super.key, required this.post});

  @override
  State<PostShareRoomDetailView> createState() =>
      _PostShareRoomDetailViewState();
}

class _PostShareRoomDetailViewState extends State<PostShareRoomDetailView> {
  late CameraPosition cameraPosition;

  @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(
      target: LatLng(
        widget.post.latitude,
        widget.post.longitude,
      ),
      zoom: 16,
    );
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

  Widget buildSection({
    required String title,
    required String body,
    Widget? trail,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        style: AppStyle.of(context).b4B.wCChineseBlack,
      ),
      subtitle: Text(
        body,
        style: AppStyle.of(context).b5.wCRhythm,
      ),
      trailing: trail,
    );
  }

  Widget requiredQuestion(String title, List<dynamic> conditions) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.of(context).b4B.wCChineseBlack),
        SizedBox(height: 10),
        for (int i = 0; i < conditions.length; i++)
          ListTile(
            title: Text(
              conditions[i],
              style: AppStyle.of(context).b5.wCChineseBlack,
            ),
            dense: true,
            contentPadding: EdgeInsets.zero,
          ),
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
            initialCameraPosition: cameraPosition,
            onMapCreated: postDetailProvider.onMapCreated,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.8,
            minChildSize: 0.25,
            builder: (context, ScrollController sc) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
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
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SharedWidgets.buildImageNetwork(
                            imgUrl: widget.post.user.avatar ?? '',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.post.user.firstName} ${widget.post.user.lastName}",
                                style: AppStyle.of(context).b4B.wCChineseBlack,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.post.user.occupation?.name ?? '',
                                style: AppStyle.of(context).b5.wCRhythm,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.post.user.native?.toUpperCase() ?? '',
                                style: AppStyle.of(context).b5.wCRhythm,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.post.user.rating?.toStringAsFixed(1) ??
                                  '0.0',
                              style: AppStyle.of(context).b5.wCRhythm,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    buildSection(
                      title: 'Name of property',
                      body: widget.post.nameOfProperty,
                      trail: Chip(
                        label: Text(widget.post.category.name),
                      ),
                    ),
                    Divider(),
                    buildSection(
                      title: 'Address',
                      body: '${widget.post.address}, ${widget.post.country}',
                    ),
                    Divider(),
                    buildSection(
                      title: 'Room Setup',
                      body: widget.post.roomSetup,
                    ),
                    Divider(),
                    buildSection(
                      title: 'Parking',
                      body: widget.post.parking,
                    ),
                    Divider(),
                    buildSection(
                      title: 'Reservation details',
                      body: widget.post.isChargeHourly
                          ? 'Hourly basis'
                          : 'Daily basis',
                      trail: Chip(
                        label: Text(
                          '${widget.post.checkinTimeFrom} - ${widget.post.checkinTimeTo}',
                        ),
                      ),
                    ),
                    Divider(),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: buildSection(
                              title: 'No. of guests',
                              body: widget.post.noOfGuestsAllowed.toString(),
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: buildSection(
                              title: 'No. of bathrooms',
                              body: widget.post.noOfBathrooms.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: buildSection(
                              title: 'Charge per group',
                              body:
                                  '\$${widget.post.pricePerGroupSize.toStringAsFixed(2)}',
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: buildSection(
                              title: 'Charge per night',
                              body:
                                  '\$${widget.post.chargePerNight.toStringAsFixed(2)}',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    buildSection(
                      title: 'Message by partner',
                      body: widget.post.message,
                    ),
                    Divider(),
                    requiredQuestion(
                      'What does this place have for you?',
                      widget.post.generalFacilities,
                    ),
                    Divider(),
                    requiredQuestion(
                      'Cooking and cleaning facilities',
                      widget.post.cookingCleaningFacilities,
                    ),
                    Divider(),
                    requiredQuestion(
                      'Entertainment facilities',
                      widget.post.entertainmentFacilities,
                    ),
                    Divider(),
                    requiredQuestion(
                      'Outside view',
                      widget.post.outsideView,
                    ),
                    Divider(),
                    requiredQuestion(
                      'What you are allowed?',
                      widget.post.houseRules,
                    ),
                    Divider(),
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
