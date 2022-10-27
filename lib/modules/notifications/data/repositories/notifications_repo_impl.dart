import 'dart:convert';

import 'package:cheffy/core/exceptions/custom_exceptions.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/modules/notifications/domain/entities/notification_entity.dart';
import 'package:cheffy/modules/notifications/domain/repositories/notification_repo.dart';
import 'package:dio/dio.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  NotificationsRepoImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<NotificationEntity>> getAllNotifications() async {
    try {
      print(ApiRoutes.register);
      final res = await _apiClient.get(ApiRoutes.notifications);
      final statusCode = res.statusCode;
      print(statusCode);
      print(res.data);
      if (statusCode == 200) {
        return (res.data as List)
            .map((not) => NotificationEntity.fromMap(not))
            .toList();
      } else {
        throw UnExpectedException();
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
      print(e.error);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
