import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class ProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final bool isMyProfile;

  ProfileViewModel(this.isMyProfile);

  void onShare() {}

  void onWallet() => _navigationService.navigateToWalletView();

  void onEdit() => _navigationService.navigateToEditProfileView();

  void onPosts() {}

  void onBookmark() {}

  void onMessage() {}

  void onTapPost() {}
}
