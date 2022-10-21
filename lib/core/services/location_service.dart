import 'package:geolocator/geolocator.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/core/services/api/api.dart';
import 'package:cheffy/core/services/api/api_provider.dart';

class LocationService {
  final Api _api = locator.get<ApiProvider>();

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error(
          'LocaleKeys.error_location_services_are_disabled.tr()');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(
            'LocaleKeys.error_location_permissions_are_denied.tr()');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'LocaleKeys.error_location_permissions_are_permanently_denied.tr()');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<List<LocationEntity>> getLocations() {
    return _api.locations();
  }
}
