import 'package:cheffy/Utils/stacked_nav_keys.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/enums/bottom_sheet_type.dart';
import 'package:cheffy/core/enums/post_type.dart';
import 'package:cheffy/core/services/authentication_service.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';

class MainViewModel extends BaseViewModel {
  // ignore: constant_identifier_names
  static const String TAG = 'MainViewModel';

  final NavigationService _navigationService = locator.get();
  final BottomSheetService _bottomSheetService = locator.get();
  final AuthenticationService _authenticationService = locator.get();
  final SecureStorageService _secureStoreService = locator.get();

  final AuthRepo authRepo;

  int _index = 0;

  String appBarTitle = 'Discover';

  MainViewModel(this.authRepo);

  //region getters setters
  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  void init() {
    // Handles Authentication Status
    _authenticationService.authStatusStream.listen((event) async {
      if (event == AuthenticationStatus.authenticated) {
      } else {}
    });
  }

  void onAddPostHandler() {
    _bottomSheetService
        .showCustomSheet<PostType, PostType>(
            variant: BottomSheetType.postCreate)
        .then((value) {
      if (value is SheetResponse<PostType> &&
          value.confirmed &&
          value.data != null) {
        _navigationService.navigateToCreatePostView(type: value.data!);
      }
    });
  }

  void onTapChangeLocation() =>
      _navigationService.navigateToLocationChangeView();

  void onTapItem(int index) {
    this.index = index;

    switch (index) {
      case 0:
        // Discover Page View
        appBarTitle = 'Discover';
        _navigationService.navigateToNestedSearchView(
            routerId: StackedNavKeys.mainNavKey);
        break;
      case 1:
        // Map Page View
        appBarTitle = 'Map';
        _navigationService.navigateToNestedMapView(
            routerId: StackedNavKeys.mainNavKey);
        break;
      case 2:
        // Posts Page View
        appBarTitle = 'Posts';
        _navigationService.navigateToNestedPostView(
            routerId: StackedNavKeys.mainNavKey);
        break;
      case 3:
        // Chats Page View
        appBarTitle = 'Profile';
        _navigationService.navigateToNestedProfileView(
            routerId: StackedNavKeys.mainNavKey);
        break;
      default:
        // Default case goes to Home Page
        appBarTitle = 'Discover';
        _navigationService.navigateToNestedSearchView(
            routerId: StackedNavKeys.mainNavKey);
        break;
    }
  }

  void onPressedNotifications() {
    _navigationService.navigateTo(Routes.notificationsView);
  }

  void onPressedSearch() {
    _navigationService.navigateTo(Routes.searchView);
  }

  void onDrawerItemPressedAbout() {
    _navigationService.navigateTo(Routes.aboutView);
  }

  void onDrawerItemPressedSettings() {
    _navigationService.navigateTo(Routes.settingsView);
  }

  void onTapViewProfile() {
    _navigationService.navigateToProfileView();
  }

  void onDrawerItemPressedHelp() {
    _navigationService.navigateTo(Routes.helpView);
  }

  void onDrawerItemPressedBookings() {
    _navigationService.navigateTo(Routes.bookingsView);
  }

  Future<void> logout() async {
    await authRepo.logout();
  }
}
