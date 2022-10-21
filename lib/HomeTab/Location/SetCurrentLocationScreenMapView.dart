import 'dart:async';

import 'package:cheffy/Utils/images,dart.dart';
import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/widgets/dummy_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetCurrentLocationScreenMapView extends StatefulWidget {
  const SetCurrentLocationScreenMapView({Key? key}) : super(key: key);

  @override
  _SetCurrentLocationScreenMapViewState createState() =>
      _SetCurrentLocationScreenMapViewState();
}

class _SetCurrentLocationScreenMapViewState
    extends State<SetCurrentLocationScreenMapView> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    // color: Colors.lightGreen.shade50,

                    color: Colors.white70,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Select your location',
                        style: AppStyle.of(context).b5M.wCRhythm,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.ic_location,
                                      width: 17,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Miami - Florida',
                                      style: AppStyle.of(context)
                                          .b3B
                                          .wCChineseBlack,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '4425 SW 8th St, Coral Gables, FL 33134',
                                  style: AppStyle.of(context).b5.wCRhythm,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton(
                            // onPressed: viewModel.onPressedChanged,
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              visualDensity: VisualDensity.compact,
                              side: BorderSide(color: AppColors.soap),
                            ),
                            child: Text(
                              'Change',
                              style: AppStyle.of(context).b5M.wCChineseBlack,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        // onPressed: viewModel.onSubmit,
                        // style: AppStyle.of(context).b4M.wCPlumpPurplePrimary,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsetsDirectional.all(15),
                          backgroundColor: AppColors.plumpPurplePrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Confirm Location',
                          style: AppStyle.of(context).b5M.wCWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
