import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/widgets/app_drawer.dart';
import 'package:cheffy/widgets/hotels/hotel_card_item.dart';
import 'package:cheffy/widgets/hotels/searched_hotel_item.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/widgets/main_app_bar.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';

import 'map_view_model.dart';

class MapPageView extends ViewModelBuilderWidget<MapViewModel> {
  const MapPageView({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget builder(BuildContext context, MapViewModel viewModel, Widget? child) {
    final mainViewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(
        title: mainViewModel.appBarTitle,
        onNotificationPressed: mainViewModel.onPressedNotifications,
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          Stack(
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
                bottom: 75,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3.75,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.filteredHotels.length,
                    itemBuilder: (context, i) {
                      final hotelItem = viewModel.filteredHotels[i];
                      return HotelCardItem(
                        hotel: hotelItem,
                        onPress: () => viewModel.onTapPost(hotelItem),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void onViewModelReady(MapViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }

  @override
  MapViewModel viewModelBuilder(BuildContext context) =>
      MapViewModel(locator.get());
}
