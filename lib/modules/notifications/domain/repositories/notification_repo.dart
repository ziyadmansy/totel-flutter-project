import 'package:cheffy/modules/notifications/domain/entities/notification_entity.dart';

abstract class NotificationsRepo {
  Future<List<NotificationEntity>> getAllNotifications();
}
