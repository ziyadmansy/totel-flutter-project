import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';

class AboutViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final AuthenticationService _authenticationService = locator.get();

  void onPrivacyPolicyClick() {
    _navigationService.navigateTo(Routes.privacyPolicyDetailsView);
  }

  void onTermsAndConditionsClick() {
    _navigationService.navigateTo(Routes.termsAndConditionsView);
  }
}
