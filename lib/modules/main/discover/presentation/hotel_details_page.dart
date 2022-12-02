import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/widgets/shared_widgets.dart';

class HotelDetailsPage extends StatefulWidget {
  final int hotelId;
  const HotelDetailsPage({
    Key? key,
    required this.hotelId,
  }) : super(key: key);

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  late CameraPosition cameraPosition;

  @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(
      target: LatLng(0, 0),
      zoom: 16,
    );
    getHotelDetails();
  }

  Future<void> getHotelDetails() async {
    final searchProvider = context.read<SearchProvider>();
    await searchProvider.getHotelDetails(widget.hotelId);
    searchProvider.animateCamera(
      LatLng(
        searchProvider.hotelDetails!.location!.lat,
        searchProvider.hotelDetails!.location!.lon,
      ),
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
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: AppBarActionButton(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              searchProvider.onHotelDetailsPressedBack();
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: cameraPosition,
            onMapCreated: searchProvider.onMapCreated,
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
                        vertical: 0.0,
                        horizontal: 120,
                      ),
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
                            imgUrl:
                                searchProvider.hotelDetails?.mainPhotoUrl ?? '',
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
                                searchProvider.hotelDetails?.name ?? '',
                                style: AppStyle.of(context).b4M.wCChineseBlack,
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${searchProvider.hotelDetails?.reviewScore ?? '0.0'} (${searchProvider.hotelDetails?.reviewNr ?? '0'})',
                                    style: AppStyle.of(context).b5.wCRhythm,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Check in',
                                    style:
                                        AppStyle.of(context).b4B.wCChineseBlack,
                                  ),
                                  Text(
                                    '${searchProvider.hotelDetails?.checkin?.from} : ${searchProvider.hotelDetails?.checkin?.to}',
                                    style: AppStyle.of(context).b4.wCRhythm,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Check out',
                                    style:
                                        AppStyle.of(context).b4B.wCChineseBlack,
                                  ),
                                  Text(
                                    '${searchProvider.hotelDetails?.checkout?.from} : ${searchProvider.hotelDetails?.checkout?.to}',
                                    style: AppStyle.of(context).b4.wCRhythm,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      isThreeLine: true,
                      leading: Image(
                        image: R.svg.ic_marker_outline(width: 32, height: 32),
                      ),
                      title: Text(
                        searchProvider.hotelDetails?.address ?? '',
                      ),
                      subtitle: Text(
                        '${searchProvider.hotelDetails?.country ?? ''}, ${searchProvider.hotelDetails?.city ?? ''}',
                        style: AppStyle.of(context).b5.wCRhythm,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    //Description
                    // buildSection(
                    //   title: 'Description',
                    //   body: widget.post.booking.hotel.description ?? '',
                    // ),
                    // Divider(),
                    SharedWidgets.buildRoundedElevatedButton(
                      btnChild: Text('Book now'),
                      onPress: () {
                        searchProvider.onTapBookNow();
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
