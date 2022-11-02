import 'package:cheffy/core/services/bidding_service.dart';
import 'package:cheffy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/main/chat/chat_view.dart';

import '../core/enums/bottom_sheet_type.dart';
import '../core/services/api/api_client.dart';
import '../core/services/api/api_provider.dart';
import '../core/services/authentication_service.dart';
import '../core/services/location_service.dart';
import '../core/services/posts_service.dart';
import '../core/services/secure_storage_service.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/otp/otp_view.dart';
import '../modules/auth/register/register_form_view.dart';
import '../modules/auth/register/register_phone_view.dart';
import '../modules/auth/register/register_view.dart';
import '../modules/chat_detail/chat_detail_view.dart';
import '../modules/location_change/location_change_view.dart';
import '../modules/location_change_map/location_change_map_view.dart';
import '../modules/main/home/home_view.dart';
import '../modules/main/main_view.dart';
import '../modules/main/map/map_view.dart';
import '../modules/main/post/post_view.dart';
import '../modules/on_boarding/on_boarding_view.dart';
import '../modules/payment/add_card/payment_add_cart_view.dart';
import '../modules/payment/options/payment_options_view.dart';
import '../modules/payment/summary/payment_summary_view.dart';
import '../modules/posts/create/create_post_view.dart';
import '../modules/posts/create/post_type_selection_view.dart';
import '../modules/posts/detail/post_detail_view.dart';
import '../modules/profile/edit/edit_profile_view.dart';
import '../modules/profile/profile_view.dart';
import '../modules/request/request_view.dart';
import '../modules/wallet/wallet_view.dart';
import 'app.locator.dart';
import 'package:firebase_core/firebase_core.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: OnBoardingView, initial: true),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: RegisterView, children: [
      // AdaptiveRoute(page: RegisterPhoneView, initial: true),
      // AdaptiveRoute(page: RegisterFormView),
      AdaptiveRoute(page: RegisterFormView, initial: true),
    ]),
    AdaptiveRoute(page: OTPView),
    AdaptiveRoute(
      page: MainView,
      children: [
        AdaptiveRoute(page: HomePageView, initial: true),
        AdaptiveRoute(page: MapPageView),
        AdaptiveRoute(page: PostsPageView),
        AdaptiveRoute(page: ChatPageView),
      ],
    ),
    AdaptiveRoute(page: ChatDetailView),
    AdaptiveRoute(page: CreatePostView),
    AdaptiveRoute(page: LocationChangeView),
    AdaptiveRoute(page: LocationChangeMapView),
    AdaptiveRoute(page: PostDetailView),
    AdaptiveRoute(page: ProfileView),
    AdaptiveRoute(page: EditProfileView),
    AdaptiveRoute(page: WalletView),
    AdaptiveRoute(page: PaymentSummaryView),
    AdaptiveRoute(page: PaymentOptionsView),
    AdaptiveRoute(page: PaymentAddCartView),
    AdaptiveRoute(page: RequestView),
  ],
  dependencies: [
    LazySingleton(classType: ApiClient),
    LazySingleton(classType: ApiProvider),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: PostsService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: BiddingService),
  ],
)
class Application {
  // ignore: constant_identifier_names
  static const TAG = 'AppSetup';

  static const String appName = 'Totel';

  static late Flavor flavor;
  static late String baseUrl;
  static late String? encAlgorithm;
  static late String encKey;
  static late String? authKey;

  static bool authHeader = false;
  static bool authBody = false;

  static Future<void> init(Flavor appFlavor, [String? environment]) async {
    flavor = appFlavor;
    authHeader = true;
    authBody = false;

    switch (flavor) {
      case Flavor.dev:
        baseUrl = 'https://metoospace.herokuapp.com/api/v1/';
        encKey = '7#6s5S\$Esb9M3v43';
        encAlgorithm = 'HmacSHA1';
        authKey = 'd742f4dc-425d-45ff-bd9d-06134940f559';
        break;
      case Flavor.qa:
        baseUrl = 'https://metoospace.herokuapp.com/api/v1/';
        encKey = '7#6s5S\$Esb9M3v43';
        encAlgorithm = 'HmacSHA1';
        authKey = 'd742f4dc-425d-45ff-bd9d-06134940f559';
        break;
      case Flavor.uat:
        baseUrl = 'https://metoospace.herokuapp.com/api/v1/';
        encKey = '7#6s5S\$Esb9M3v43';
        encAlgorithm = 'HmacSHA1';
        authKey = 'd742f4dc-425d-45ff-bd9d-06134940f559';
        break;
      case Flavor.prod:
        baseUrl = 'https://metoospace.herokuapp.com/api/v1/';
        encKey = '7#6s5S\$Esb9M3v43';
        encAlgorithm = 'HmacSHA1';
        authKey = 'd742f4dc-425d-45ff-bd9d-06134940f559';
        break;
    }

    WidgetsFlutterBinding.ensureInitialized();
    ResponsiveSizingConfig.instance.setCustomBreakpoints(
      const ScreenBreakpoints(desktop: 800, tablet: 500, watch: 200),
    );

    //region firebase
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform(flavor),
    // );

    // References the firebase_options in the root not in the (firebase) folder
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    //endregion

    Log.init(logInDebugMode: kDebugMode, logInReleaseMode: kReleaseMode);
    Currency.init(locale: 'en_US', symbol: '\$', decimalDigits: 2);

    setupLocator(environment: environment);

    await ThemeManager.initialise();

    _setupSnackbarUi();
    _setupCustomDialogs();
  }

  static void _setupSnackbarUi() {
    final service = locator<SnackbarService>();

    // Registers a config to be used when calling showSnackbar
    service.registerSnackbarConfig(SnackbarConfig(
      backgroundColor: AppColors.crayola,
      textColor: AppColors.chineseBlack,
      messageColor: AppColors.chineseBlack,
      mainButtonTextColor: Colors.black,
    ));
  }

  static void _setupCustomDialogs() {
    // final dialogService = locator<DialogService>();
    final bottomSheetService = locator<BottomSheetService>();

    // final dialogBuilders = {
    //   CustomDialogType.manualScanner: (context, dialogRequest, response) =>
    //       ManualScannerView(dialogRequest: dialogRequest, response: response)
    // };

    final bottomSheetBuilders = {
      BottomSheetType.postCreate: (context, sheetRequest, completer) =>
          PostTypeSelectionView(request: sheetRequest, completer: completer)
    };

    // dialogService.registerCustomDialogBuilders(dialogBuilders);
    bottomSheetService.setCustomSheetBuilders(bottomSheetBuilders);
  }
}

enum Flavor { prod, qa, dev, uat }

extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.prod:
        return 'prod';
      case Flavor.qa:
        return 'test';
      case Flavor.dev:
        return 'dev';
      case Flavor.uat:
        return 'uat';
      default:
        return 'unknown';
    }
  }

  String get appNameSuffix {
    switch (this) {
      case Flavor.prod:
        return '';
      case Flavor.qa:
        return '|QA';
      case Flavor.dev:
        return '|DEV';
      case Flavor.uat:
        return '|UAT';
      default:
        return '|Unknown';
    }
  }
}
