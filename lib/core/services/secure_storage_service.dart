import 'dart:convert';

import 'package:cheffy/ui/views/auth/auth/domain/entities/profile_entity.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:cheffy/core/models/data/app_user_entity.dart';

class SecureStorageService {
  // ignore: constant_identifier_names
  static const TAG = 'SecureStorageService';

  static const _keyAppUser = 'app_user';
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  final FlutterSecureStorage _instance = const FlutterSecureStorage();

  Future<ProfileEntity?> getAppUser() async {
    try {
      var res = await _instance.read(key: _keyAppUser);
      Log.d(TAG, '$res', references: ['getAppUser']);

      if (res != null) {
        return ProfileEntity.fromJson(json.decode(res));
      }
    } on PlatformException catch (e) {
      Log.e(TAG, '${e.message}',
          references: ['getAppUser'],
          exception: e,
          stackTrace: e.stacktrace.isNotNullOrEmpty
              ? StackTrace.fromString(e.stacktrace!)
              : null);
    }
    return null;
  }

  Future<ProfileEntity?> setAppUser(ProfileEntity? appUser) async {
    try {
      if ((await _instance.containsKey(key: _keyAppUser)) || appUser == null) {
        await _instance.delete(key: _keyAppUser);
      }

      if (appUser != null) {
        await _instance.write(
            key: _keyAppUser, value: json.encode(appUser.toJson()));
        return appUser;
      }
    } on PlatformException catch (e) {
      Log.e(TAG, '${e.message}',
          references: ['setAppUser'],
          exception: e,
          stackTrace: e.stacktrace.isNotNullOrEmpty
              ? StackTrace.fromString(e.stacktrace!)
              : null);
    }

    return null;
  }

  Future<String?> getAccessToken() async {
    try {
      String? res = await _instance.read(key: _keyAccessToken);
      Log.d(TAG, '$res', references: ['getAccessToken']);
      return res;
    } on PlatformException catch (e) {
      Log.e(TAG, '${e.message}',
          references: ['getAccessToken'],
          exception: e,
          stackTrace: e.stacktrace.isNotNullOrEmpty
              ? StackTrace.fromString(e.stacktrace!)
              : null);
    }
    return null;
  }

  Future<String?> setAccessToken(String? token) async {
    try {
      if ((await _instance.containsKey(key: _keyAccessToken)) ||
          token == null) {
        await _instance.delete(key: _keyAccessToken);
      }

      if (token != null) {
        await _instance.write(key: _keyAccessToken, value: token);
        return token;
      }
    } on PlatformException catch (e) {
      Log.e(TAG, '${e.message}',
          references: ['setAccessToken'],
          exception: e,
          stackTrace: e.stacktrace.isNotNullOrEmpty
              ? StackTrace.fromString(e.stacktrace!)
              : null);
    }

    return null;
  }

  Future<String?> getRefreshToken() async {
    try {
      var res = await _instance.read(key: _keyRefreshToken);
      Log.d(TAG, '$res', references: ['getRefreshToken']);
      return res;
    } on PlatformException catch (e) {
      Log.e(TAG, '${e.message}',
          references: ['getRefreshToken'],
          exception: e,
          stackTrace: e.stacktrace.isNotNullOrEmpty
              ? StackTrace.fromString(e.stacktrace!)
              : null);
    }
    return null;
  }

  Future<String?> setRefreshToken(String? token) async {
    try {
      if ((await _instance.containsKey(key: _keyRefreshToken)) ||
          token == null) {
        await _instance.delete(key: _keyRefreshToken);
      }

      if (token != null) {
        await _instance.write(key: _keyRefreshToken, value: token);
        return token;
      }
    } on PlatformException catch (e) {
      Log.e(TAG, '${e.message}',
          references: ['setRefreshToken'],
          exception: e,
          stackTrace: e.stacktrace.isNotNullOrEmpty
              ? StackTrace.fromString(e.stacktrace!)
              : null);
    }

    return null;
  }
}
