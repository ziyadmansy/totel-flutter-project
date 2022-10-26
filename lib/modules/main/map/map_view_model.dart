import 'package:cheffy/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/services/location_service.dart';

class MapViewModel extends BaseViewModel {
  final LocationService _locationService = locator.get();
  final DialogService _dialogService = locator.get();

  late final GoogleMapController _controller;

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _navigateToCurrent();
  }

  void _navigateToCurrent() {
    _locationService.determinePosition().then((value) {
      _controller.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(value.latitude, value.longitude), 14));
    },
        onError: (error) =>
            _dialogService.showDialog(description: error.toString()));
  }

  onTapPost(context) {
    final NavigationService _navigationService = locator.get();
    _navigationService.navigateToPostDetailView();
  }
}
