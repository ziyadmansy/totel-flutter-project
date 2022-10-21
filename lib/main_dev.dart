import 'package:flutter/material.dart';

import 'app/app.dart';
import 'main.dart';

void main() async {
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
