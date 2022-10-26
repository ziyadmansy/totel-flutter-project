import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/widgets/main_app_bar.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';

import 'map_view_model.dart';

class MapView extends ViewModelBuilderWidget<MapViewModel> {
  const MapView({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget builder(BuildContext context, MapViewModel viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        primary: false,
        body: Stack(
          children: [
            Column(
              children: [
                const MainAppBar(),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: GoogleMap(
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: viewModel.onMapCreated,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: 282,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(width: 8),
                              PostListingItemView(
                                layoutType: 1,
                                image: R.image.img_ad_1(),
                                dateRange: '4 Jun - 6 Jun',
                                title: 'Hilton Miami Downtown',
                                by: 'Albert Flores',
                                price: '\$90',
                                period: 'Day',
                                onTap: () => viewModel.onTapPost(context),
                              ),
                              PostListingItemView(
                                layoutType: 1,
                                image: R.image.img_ad_2(),
                                dateRange: '4 Jun - 6 Jun',
                                title: 'Radisson RED Miami Airport',
                                by: 'Albert Flores',
                                price: '\$90',
                                period: 'Day',
                                onTap: () => viewModel.onTapPost(context),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  MapViewModel viewModelBuilder(BuildContext context) => MapViewModel();
}
