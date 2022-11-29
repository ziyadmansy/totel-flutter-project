import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/app_drawer/presentation/app_drawer_provider.dart';
import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/posts/create/create_post_view_model.dart';
import 'package:cheffy/modules/posts/detail/post_detail_view_model.dart';
import 'package:cheffy/modules/posts/posts/presentation/providers/posts_provider.dart';
import 'package:provider/provider.dart';

final appProviders = [
  ChangeNotifierProvider<PaymentViewModel>(create: (_) => PaymentViewModel()),
  ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(locator.get())),
  ChangeNotifierProvider<AppDrawerProvider>(
      create: (_) => AppDrawerProvider(locator.get())),
  ChangeNotifierProvider<CreatePostViewModel>(
      create: (_) => CreatePostViewModel(locator.get())),
  ChangeNotifierProvider<PostsProvider>(
      create: (_) => PostsProvider(locator.get())),
  ChangeNotifierProvider<PostDetailViewModel>(
      create: (_) => PostDetailViewModel()),
  ChangeNotifierProvider<ProfileProvider>(
      create: (_) => ProfileProvider(locator.get())),
  ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(locator.get())),
];
