import 'package:cheffy/core/exceptions/location_exception.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:location/location.dart';

class SharedCore {
  static String getTimeAgoFromDate(DateTime date) {
    return GetTimeAgo.parse(date);
  }

  static Future<void> checkLocationPermissions() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw LocationException('GPS Service is disabled');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw LocationException('Location Permission is denied');
      }
    }
  }

  static Future<LocationData> getLocationData() async {
    Location location = Location();
    LocationData _locationData = await location.getLocation();
    return _locationData;
  }
}
