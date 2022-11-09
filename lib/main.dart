import 'package:cheffy/Utils/app_providers.dart';
import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.dart';
import 'app/app.router.dart';
import 'modules/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Application.init(Flavor.dev);

  // if (kDebugMode) {
  runApp(const App());
  // } else {
  //   runZonedGuarded(
  //       () => runApp(const MyApp()),
  //       (error, stack) => FirebaseCrashlytics.instance
  //           .recordError(error, stack, fatal: true));
  // }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return EasyLocalization(
    //   supportedLocales: const [Locale('en'), Locale('si'), Locale('ta')],
    //   path: 'assets/langs',
    //   fallbackLocale: const Locale('en'),
    //   useOnlyLangCode: true,
    //   child:
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light, // Dark mode is not well implemented
      darkTheme: AppTheme.of(context).dark,
      lightTheme: AppTheme.of(context).light,
      builder: (context, regularTheme, darkTheme, themeMode) => MultiProvider(
        providers: appProviders,
        child: MaterialApp(
          title: '${Application.appName}${Application.flavor.appNameSuffix}',
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        ),
      ),
      // ),
    );
  }
}
