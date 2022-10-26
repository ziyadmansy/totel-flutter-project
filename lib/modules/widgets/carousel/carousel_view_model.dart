import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';

class CarouselViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  int _index = 0;

  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  void onPageChange(int pageIndex) => index = pageIndex;
}
