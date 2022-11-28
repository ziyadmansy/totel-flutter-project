import 'package:cheffy/Utils/shared_core.dart';
import 'package:cheffy/core/exceptions/location_exception.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationService {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<LatLng> getLocation() async {
    try {
      await SharedCore.checkLocationPermissions();
      LocationData position = await SharedCore.getLocationData();

      print(position.longitude);
      print(position.latitude);

      print('initial Location Got successfully');

      return LatLng(position.latitude!, position.longitude!);
    } on LocationException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
