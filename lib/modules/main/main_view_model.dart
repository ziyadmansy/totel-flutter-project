import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/enums/bottom_sheet_type.dart';
import 'package:cheffy/core/enums/post_type.dart';
import 'package:cheffy/core/models/data/app_user_entity.dart';
import 'package:cheffy/core/services/authentication_service.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';

class MainViewModel extends BaseViewModel {
  // ignore: constant_identifier_names
  static const String TAG = 'MainViewModel';
  static const int navKey = 1;

  final NavigationService _navigationService = locator.get();
  final BottomSheetService _bottomSheetService = locator.get();
  final AuthenticationService _authenticationService = locator.get();
  final SecureStorageService _secureStoreService = locator.get();

  final AuthRepo authRepo;

  int _index = 0;

  ProfileEntity? _appUser;

  String? _location = 'Miami, Florida';

  MainViewModel(this.authRepo);

  //region getters setters
  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  ProfileEntity? get appUser => _appUser;

  set appUser(ProfileEntity? appUserEntity) {
    _appUser = appUserEntity;
    notifyListeners();
  }

  String? get location => _location;

  set location(String? location) {
    _location = location;
    notifyListeners();
  }

  void init() {
    // Handles Authentication Status
    _authenticationService.authStatusStream.listen((event) async {
      if (event == AuthenticationStatus.authenticated) {
        appUser = await _secureStoreService.getAppUser();
      } else {
        appUser = null;
      }
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
        // Home Page View
        _navigationService.navigateToNestedHomeView(
            routerId: MainViewModel.navKey);
        break;
      case 1:
        // Map Page View
        _navigationService.navigateToNestedMapView(
            routerId: MainViewModel.navKey);
        break;
      case 2:
        // Posts Page View
        _navigationService.navigateToNestedPostView(
            routerId: MainViewModel.navKey);
        break;
      case 3:
        // Chats Page View
        _navigationService.navigateToNestedChatView(
            routerId: MainViewModel.navKey);
        break;
      default:
        // Default case goes to Home Page
        _navigationService.navigateToNestedHomeView(
            routerId: MainViewModel.navKey);
        break;
    }
  }

  void onPressedNotifications() {
    _navigationService.navigateTo(Routes.notificationsView);
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

  Future<void> logout() async {
    await authRepo.logout();
  }
}
