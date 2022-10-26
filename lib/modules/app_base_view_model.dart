import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../core/services/authentication_service.dart';
import '../core/services/location_service.dart';

class AppBaseViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService = locator.get();
  final LocationService _locationService = locator.get();
  final DialogService _dialogService = locator.get();

  Future<Position?> getCurrentLocation() async {
    try {
      return await _locationService.determinePosition();
    } catch (e) {
      await _dialogService.showDialog(
          title: 'LocaleKeys.error_determine_current_location.tr()',
          description: '$e');
      return null;
    }
  }
}
