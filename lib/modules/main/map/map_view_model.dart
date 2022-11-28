import 'package:cheffy/Utils/constants.dart';
import 'package:cheffy/Utils/shared_core.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/exceptions/location_exception.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/map/domain/repositories/maps_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/services/location_service.dart';

class MapViewModel extends BaseViewModel {
  final LocationService _locationService = locator.get();
  final DialogService _dialogService = locator.get();
  final SnackbarService _snackbarService = locator.get();

  List<HotelEntity> filteredHotels = [];

  late final GoogleMapController _controller;

  final MapsRepo mapsRepo;

  MapViewModel(this.mapsRepo);

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    _navigateToCurrentAndGetData();
  }

  void _navigateToCurrentAndGetData() async {
    try {
      LatLng userCurrentLocation = await _locationService.getLocation();
      _controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          userCurrentLocation,
          mapZoomValue,
        ),
      );
      await getFilteredHotels(userCurrentLocation);
    } on LocationException catch (e) {
      _snackbarService.showSnackbar(
        message:
            'Location is not enabled, please accept the permission and enable then try again',
      );
    } catch (e) {
      print(e);
      _dialogService.showDialog(description: error.toString());
    }
  }

  Future<void> getFilteredHotels(LatLng userCurrentLocation) async {
    try {
      setBusyForObject(filteredHotels, true);
      filteredHotels = await mapsRepo.getHotelsByCoordinates(
        lat: 13.965,
        lon: 8.17478,
      );
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      setBusyForObject(filteredHotels, false);
    }
  }

  void onTapPost(HotelEntity hotel) {
    // final NavigationService _navigationService = locator.get();
    // _navigationService.navigateToPostDetailView();
  }
}
