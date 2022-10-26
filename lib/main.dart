import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/ui/views/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/ui/views/profile/profile/domain/repositories/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.dart';
import 'app/app.router.dart';
import 'ui/theme/theme.dart';
import 'ui/views/auth/auth/domain/repositories/auth_repo.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Future<void> x() async {
    // final result = await locator.get<AuthRepo>().login('usertest@gmail.com', '123456');
    // final result = await locator.get<ProfileRepo>().get();
/*
    final profile  = ProfileEntity.fromJson({
      "id": 16,
      "first_name": "kim",
      "last_name": "john",
      "username": "usertest@gmail.com",
      "email": "usertest@gmail.com",
      "password": "caX5ahcyH3jZGkKWpcnqe1LzXAcVa0whX35uPhBD9cWwFUeaK2TS",
      "native": null,
      "bio": null,
      "phone_no": null,
      "date_of_brith": null,
      "avatar": null,
      "city": null,
      "rating": 5,
      "gender": null,
      "created_at": "2022-10-23T22:23:42.956Z",
      "updated_at": "2022-10-23T22:23:42.956Z",
      "hobbie": null,
      "occupation": null
    });
*/
    // print('result is ${result}');
  }

  @override
  Widget build(BuildContext context) {
    print('ss');
    x();
    // return EasyLocalization(
    //   supportedLocales: const [Locale('en'), Locale('si'), Locale('ta')],
    //   path: 'assets/langs',
    //   fallbackLocale: const Locale('en'),
    //   useOnlyLangCode: true,
    //   child:
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.system,
      darkTheme: AppTheme.of(context).dark,
      lightTheme: AppTheme.of(context).light,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: '${Application.appName}${Application.flavor.appNameSuffix}',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
      // ),
    );
  }
}
