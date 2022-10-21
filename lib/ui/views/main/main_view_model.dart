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

  AppUserEntity? _appUser;

  String? _location = 'Miami, Florida';

  //region getters setters
  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  AppUserEntity? get appUser => _appUser;

  set appUser(AppUserEntity? appUserEntity) {
    _appUser = appUserEntity;
    notifyListeners();
  }

  String? get location => _location;

  set location(String? location) {
    _location = location;
    notifyListeners();
  }

  //endregion

  void init() {
    _authenticationService.authStatusStream.listen((event) async {
      if (event == AuthenticationStatus.authenticated) {
        appUser = await _secureStoreService.getAppUser();
      } else {
        appUser = null;
      }
    });
  }

  void onTapChangeLocation() =>
      _navigationService.navigateToLocationChangeView();

  void onTapItem(int index) {
    this.index = index;

    switch (index) {
      case 1:
        _navigationService.navigateToNestedMapView(routerId: navKey);
        break;
      case 2:
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
        break;
      case 3:
        _navigationService.navigateToNestedPostView(routerId: navKey);
        break;
      case 4:
        _navigationService.navigateToNestedChatView(routerId: navKey);
        break;
      case 0:
      default:
        _navigationService.navigateToNestedHomeView(routerId: navKey);
        break;
    }
  }

  void onPressedNotifications() {}

  void onTapViewProfile() => _navigationService.navigateToProfileView();
}
