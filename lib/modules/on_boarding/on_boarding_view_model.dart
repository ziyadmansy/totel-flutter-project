import 'package:fresh_dio/fresh_dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/services/authentication_service.dart';

class OnBoardingViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final AuthenticationService _authenticationService = locator.get();

  void onPressedSkip() async {
    // await _authenticationService.initEnvironment();

    if (_authenticationService.authState ==
        AuthenticationStatus.authenticated) {
      _navigationService.replaceWith(Routes.mainView);
    } else {
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
