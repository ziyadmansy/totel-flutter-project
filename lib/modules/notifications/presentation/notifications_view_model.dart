import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/services/location_service.dart';
import 'package:cheffy/modules/notifications/domain/entities/notification_entity.dart';
import 'package:cheffy/modules/notifications/domain/repositories/notification_repo.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final LocationService _locationService = locator.get();

  final NotificationsRepo notifRepo;

  NotificationsViewModel(this.notifRepo);

  List<NotificationEntity> notifications = [];

  Future<void> getNotifications() async {
    try {
      setBusy(true);
      notifications = await notifRepo.getAllNotifications();
      notifyListeners();
    } catch (e) {
    } finally {
      setBusy(false);
    }
  }
}
