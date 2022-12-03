import 'package:cheffy/Utils/constants.dart';
import 'package:cheffy/modules/main/discover/domain/entities/booking_hotel_entity.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/widgets/shared_widgets.dart';

class HotelDetailsPage extends StatefulWidget {
  final BookingHotelEntity hotel;
  const HotelDetailsPage({
    Key? key,
    required this.hotel,
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
      zoom: mapZoomValue,
    );
    getHotelDetails();
  }

  Future<void> getHotelDetails() async {
    final searchProvider = context.read<SearchProvider>();
    await searchProvider.getHotelDetails(widget.hotel.hotelId);
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

  Widget requiredQuestion(String title, List<String> conditions) {
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
      body: ProviderProgressLoader(
        isLoading: searchProvider.busy(searchProvider.hotelDetails),
        child: Stack(
          children: [
            if (!searchProvider.busy(searchProvider.hotelDetails) &&
                searchProvider.hotelDetails != null)
              GoogleMap(
                initialCameraPosition: cameraPosition,
                onMapCreated: searchProvider.onMapCreated,
                markers: {
                  Marker(
                    markerId: MarkerId(
                      searchProvider.hotelDetails!.hotelId!.toString(),
                    ),
                    position: LatLng(
                      searchProvider.hotelDetails!.location!.lat,
                      searchProvider.hotelDetails!.location!.lon,
                    ),
                  ),
                },
              ),
            DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.2,
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
                                  searchProvider.hotelDetails?.mainPhotoUrl ??
                                      '',
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
                                  style:
                                      AppStyle.of(context).b4M.wCChineseBlack,
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
                                      style: AppStyle.of(context)
                                          .b4B
                                          .wCChineseBlack,
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
                                      style: AppStyle.of(context)
                                          .b4B
                                          .wCChineseBlack,
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
                          '${searchProvider.hotelDetails?.city ?? ''}, ${searchProvider.hotelDetails?.country ?? ''}',
                          style: AppStyle.of(context).b5.wCRhythm,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      requiredQuestion(
                        'Allowances',
                        [
                          widget.hotel.childrenNotAllowed == 0
                              ? 'Children not allowed'
                              : 'Children allowed',
                          widget.hotel.hasFreeParking == 0
                              ? 'Has no free parking'
                              : 'Has free parking',
                          widget.hotel.hasSwimmingPool == 0
                              ? 'Has no swimming pool'
                              : 'Has swimming pool',
                          widget.hotel.hotelIncludeBreakfast == 0
                              ? 'Doesn\'t include breakfast'
                              : 'Includes breakfast',
                          widget.hotel.isFreeCancellable == 0
                              ? 'Has no free cancellation'
                              : 'Has free cancellation',
                          widget.hotel.isNoPrepaymentBlock == 0
                              ? 'Has repayment block'
                              : 'No repayment block',
                        ],
                      ),
                      Divider(),
                      if (searchProvider.hotelDetails != null)
                        SharedWidgets.buildRoundedElevatedButton(
                          btnChild: Text('Book now'),
                          onPress: () {
                            searchProvider.onTapBookNow(
                              hotel: widget.hotel,
                              hotelDetails: searchProvider.hotelDetails!,
                            );
                          },
                        ),
                      SizedBox(height: 50),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
