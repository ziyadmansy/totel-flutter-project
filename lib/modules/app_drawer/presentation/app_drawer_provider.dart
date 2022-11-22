import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/app_drawer/domain/entities/help_entity.dart';
import 'package:cheffy/modules/app_drawer/domain/repositories/app_drawer_repo.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppDrawerProvider extends BaseViewModel {
  final AppDrawerRepo drawerRepo;

  AppDrawerProvider(this.drawerRepo);

  final NavigationService _navigationService = locator.get();
  final SnackbarService _snackbarService = locator.get();

  List<HelpEntity> helpQuestions = [];

  Future<void> getHelpQuestions() async {
    try {
      setBusy(true);
      helpQuestions = await drawerRepo.getHelpMenu();
      notifyListeners();
    } catch (e) {
      print(e);
      _snackbarService.showSnackbar(
        title: 'Error',
        message: 'Something went wrong, please try again',
      );
    } finally {
      setBusy(false);
    }
  }
}
