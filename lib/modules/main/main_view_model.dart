import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
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

  int _index = 0;

  ProfileEntity? _appUser;

  String? _location = 'Miami, Florida';

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
      case 1:
        // Map Page View
        _navigationService.navigateToNestedMapView(routerId: navKey);
        break;
      case 3:
        // Posts Page View
        _navigationService.navigateToNestedPostView(routerId: navKey);
        break;
      case 4:
        // Chats Page View
        _navigationService.navigateToNestedChatView(routerId: navKey);
        break;
      case 0:
      default:
        // Home Page View
        _navigationService.navigateToNestedHomeView(routerId: navKey);
        break;
    }
  }

  void onPressedNotifications() {
    _navigationService.navigateTo(Routes.notificationsView);
  }

  void onDrawerItemPressedAbout() {
    _navigationService.navigateTo(Routes.aboutView);
  }

  void onTapViewProfile() {
    _navigationService.navigateToProfileView();
  }
}
