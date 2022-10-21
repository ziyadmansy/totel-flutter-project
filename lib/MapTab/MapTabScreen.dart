import 'dart:async';

import 'package:cheffy/Utils/images,dart.dart';
import 'package:flutter/material.dart';

import '../widgets/post_listing_item/post_listing_item_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTabScreen extends StatefulWidget {
  const MapTabScreen({Key? key}) : super(key: key);

  @override
  _MapTabScreenState createState() => _MapTabScreenState();
}

class _MapTabScreenState extends State<MapTabScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: false,
        body: Stack(
          children: [
            // const Positioned(
            //   left: 0,
            //   right: 0,
            //   top: 0,
            //   child: MainAppBar(),
            // ),
            Container(
              // height: MediaQuery.of(context).size.height,
              color: Colors.lightGreen.shade50,
              child:
                  // Text('')
                  GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                onMapCreated: _onMapCreated,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 242,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(width: 8),
                    PostListingItemView(
                      layoutType: 1,
                      image: AssetImage(AppImages.img_ad_1),
                      dateRange: '4 Jun - 6 Jun',
                      title: 'Hilton Miami Downtown',
                      by: 'Albert Flores',
                      price: '\$90',
                      period: 'Day',
                      // onTap: () => viewModel.onTapPost(),
                      onTap: () {},
                    ),
                    PostListingItemView(
                      layoutType: 1,
                      image: AssetImage(AppImages.img_ad_2),
                      dateRange: '4 Jun - 6 Jun',
                      title: 'Radisson RED Miami Airport',
                      by: 'Albert Flores',
                      price: '\$90',
                      period: 'Day',
                      // onTap: () => viewModel.onTapPost(),
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
