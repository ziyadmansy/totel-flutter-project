import 'package:cheffy/modules/app_drawer/data/repositories/app_drawer_repo_impl.dart';
import 'package:cheffy/modules/app_drawer/domain/repositories/app_drawer_repo.dart';
import 'package:cheffy/modules/auth/auth/data/repositories/auth_repo_impl.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:cheffy/modules/notifications/data/repositories/notifications_repo_impl.dart';
import 'package:cheffy/modules/notifications/domain/repositories/notification_repo.dart';
import 'package:cheffy/modules/posts/posts/data/repositories/post_repo_impl.dart';
import 'package:cheffy/modules/posts/posts/domain/repositories/post_repo.dart';
import 'package:cheffy/modules/main/profile/profile/data/repositories/profile_repo_impl.dart';
import 'package:cheffy/modules/main/profile/profile/domain/repositories/profile_repo.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/stacked_services.dart';
import '../core/services/api/api_client.dart';
import '../core/services/api/api_provider.dart';
import '../core/services/authentication_service.dart';
import '../core/services/location_service.dart';
import '../core/services/secure_storage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => ApiClient());
  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl());

  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
  locator.registerLazySingleton<PostRepo>(() => PostRepoImpl(locator.get()));
  locator.registerLazySingleton<AppDrawerRepo>(
      () => AppDrawerRepoImpl(locator.get()));
  locator.registerLazySingleton<NotificationsRepo>(
      () => NotificationsRepoImpl(locator.get()));

  locator.registerLazySingleton(() => ApiProvider());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => LocationService());
}
