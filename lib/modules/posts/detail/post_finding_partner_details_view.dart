import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';

import 'post_detail_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostFindingPartnerDetailView extends StatefulWidget {
  final FindingPartnerPost post;
  const PostFindingPartnerDetailView({super.key, required this.post});

  @override
  State<PostFindingPartnerDetailView> createState() =>
      _PostFindingPartnerDetailViewState();
}

class _PostFindingPartnerDetailViewState
    extends State<PostFindingPartnerDetailView> {
  late CameraPosition cameraPosition;

  @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(
      target: LatLng(widget.post.booking.hotel.latitude,
          widget.post.booking.hotel.longitude),
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SharedWidgets.buildImageNetwork(
                            imgUrl: widget.post.booking.hotel.imageUrl,
                            width: 120,
                            height: 100,
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
                                widget.post.booking.hotel.name,
                                style: AppStyle.of(context).b4M.wCChineseBlack,
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    widget.post.booking.hotel.rating
                                            ?.toStringAsFixed(1) ??
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
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: Text(
                                  '${UniversalVariables.dayMonthDateFormat.format(widget.post.booking.checkInDate)} - ${UniversalVariables.dayMonthDateFormat.format(widget.post.booking.checkOutDate)}',
                                  style:
                                      AppStyle.of(context).b4M.wCChineseBlack,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${widget.post.booking.amount.toStringAsFixed(2)} ${widget.post.booking.currency}',
                                style: AppStyle.of(context).b4B.wCChineseBlack,
                              )
                            ],
                          ),
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
                            widget.post.booking.hotel.address ?? '',
                            style: AppStyle.of(context).b5.wCRhythm,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    //Partner part
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
                                widget.post.user.native ?? '',
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
                    //Description
                    buildSection(
                      title: 'Description',
                      body: widget.post.booking.hotel.description ?? '',
                    ),
                    Divider(),
                    // Message to partner
                    buildSection(
                      title: 'Message to partner',
                      body: widget.post.messageToPartner,
                    ),
                    Divider(),
                    // Gender
                    buildSection(
                      title: 'Partner Gender',
                      body: widget.post.partnerGender,
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
