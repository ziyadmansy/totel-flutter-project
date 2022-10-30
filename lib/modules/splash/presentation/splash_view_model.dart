import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/modules/on_boarding/on_boarding_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  Future<void> navigateToApp() async {
    Future.delayed(
      Duration(seconds: 1),
      () {
        _navigationService.replaceWith(Routes.onBoardingView);
      },
    );
  }
}
