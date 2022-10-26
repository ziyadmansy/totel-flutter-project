import 'package:cheffy/core/services/bidding_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  void onPressedNotifications() {}
//TODO: API CALL FOR BIDDINGS LIST
  final BiddingService _biddingService = locator.get();

  void onTapPost() {
    _biddingService.getBiddings();
    _navigationService.navigateToPostDetailView();
  }
}
