import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/services/authentication_service.dart';
import 'package:cheffy/modules/on_boarding/on_boarding_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final AuthenticationService _authenticationService = locator.get();

  Future<void> navigateToApp() async {
    Future.delayed(
      Duration(seconds: 1),
      () async {
        await _authenticationService.initEnvironment();
        _navigationService.replaceWith(Routes.mainView);

        // Deleted on boarding screen temporarily
        // _navigationService.replaceWith(Routes.onBoardingView);

        // Commented due to heroku app server down
        // if (_authenticationService.authState ==
        //     AuthenticationStatus.authenticated) {
        //   _navigationService.replaceWith(Routes.mainView);
        // } else {
        //   _navigationService.replaceWith(Routes.loginView);
        // }
      },
    );
  }
}
