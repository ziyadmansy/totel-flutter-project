import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostsProvider extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  void onTapPost() {
    _navigationService.navigateTo(Routes.postDetailView);
  }
}
