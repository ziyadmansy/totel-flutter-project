import 'package:cheffy/Utils/constants.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostDetailViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  final LocationService _locationService = locator.get();
  final DialogService _dialogService = locator.get();
  late final GoogleMapController _controller;
  // Post? post;

  bool isRequested = false;

  void init() {
    print(_navigationService.currentArguments);
    // post = _navigationService.currentArguments;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void onPressedBack() {
    _navigationService.back();
    _controller.dispose();
  }

  void onTapBookNow() {
    //added
    _navigationService.navigateToPaymentSummaryView();
  }

  void onSendMessage() {}

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
    // _controller.animateCamera(
    //   CameraUpdate.newLatLngZoom(
    //     location,
    //     mapZoomValue,
    //   ),
    // );
  }

  // void _navigateToCurrent() {
  //   _locationService.determinePosition().then((value) {
  //     _controller.animateCamera(CameraUpdate.newLatLngZoom(
  //         LatLng(value.latitude, value.longitude), 14));
  //   },
  //       onError: (error) =>
  //           _dialogService.showDialog(description: error.toString()));
  // }

  void onRequest() {
    if (isRequested) {
      _navigationService.navigateToPaymentSummaryView();
    } else {
      _navigationService.navigateToRequestView();
    }
  }
}
