import 'package:cheffy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:cheffy/modules/theme/color.dart';

import '../core/enums/bottom_sheet_type.dart';
import '../modules/posts/create/post_type_selection_view.dart';
import 'app.locator.dart';

class Application {
  // ignore: constant_identifier_names
  static const TAG = 'AppSetup';

  static const String appName = 'Totel';

  // This is temporary till backend fixes it
  static String imgBaseUrl = 'https://metoospace.herokuapp.com';

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

    // References the firebase_options in the root not in the (firebase) folder
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Only send crashlytics outside dev env
    if (flavor != Flavor.dev) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
    }

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
