import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/core/services/location_service.dart';

class LocationChangeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final LocationService _locationService = locator.get();

  final StreamController<List<LocationEntity>> _locationsController =
      StreamController();

  Stream<List<LocationEntity>> get locations => _locationsController.stream;

  //region getters setters

  //endregion

  void init() async {
    _locationService
        .getLocations()
        .then((value) => _locationsController.add(value));
  }

  void onTapSetCurrentLocation() =>
      _navigationService.navigateToLocationChangeMapView();

  void onPressedChanged() {}

  void onTapLocationItem(int index, LocationEntity data) =>
      _navigationService.back(result: data);
}
