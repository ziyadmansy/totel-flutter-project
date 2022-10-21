import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class ChatViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  void onTapChat() => _navigationService.navigateToChatDetailView();
}
