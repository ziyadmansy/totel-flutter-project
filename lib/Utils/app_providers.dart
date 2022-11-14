import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/posts/posts/posts_provider.dart';
import 'package:cheffy/modules/settings/presentation/settings_view_model.dart';
import 'package:provider/provider.dart';

final appProviders = [
  ChangeNotifierProvider<PaymentViewModel>(create: (_) => PaymentViewModel()),
  ChangeNotifierProvider<SettingsViewModel>(create: (_) => SettingsViewModel()),
  ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
  ChangeNotifierProvider<PostsProvider>(create: (_) => PostsProvider()),
  ChangeNotifierProvider<ProfileProvider>(
      create: (_) => ProfileProvider(locator.get())),
  ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(locator.get())),
];
