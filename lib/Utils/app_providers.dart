import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:cheffy/modules/profile/profile_provider.dart';
import 'package:cheffy/modules/search/presentation/search_provider.dart';
import 'package:cheffy/modules/settings/presentation/settings_view_model.dart';
import 'package:provider/provider.dart';

final appProviders = [
  ChangeNotifierProvider<PaymentViewModel>(create: (_) => PaymentViewModel()),
  ChangeNotifierProvider<SettingsViewModel>(create: (_) => SettingsViewModel()),
  ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
  ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider(locator.get())),
  ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(locator.get())),
];
