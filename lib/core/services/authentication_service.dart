import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';

import '../../app/app.locator.dart';
import 'api/api_provider.dart';

class AuthenticationService {
  // ignore: constant_identifier_names
  static const String TAG = 'AuthenticationService';

  final ApiProvider _api = locator.get<ApiProvider>();
  final SecureStorageService _secureStorageService = locator.get();
  final _auth = FirebaseAuth.instance;

  Stream<AuthenticationStatus> get authStatusStream =>
      _api.fresh.authenticationStatus;

  AuthenticationStatus _authState = AuthenticationStatus.initial;

  AuthenticationStatus get authState => _authState;

  AuthenticationService() {
    _api.fresh.authenticationStatus.listen((event) {
      Log.d(TAG, '$event',
          references: ['AuthenticationService', 'authenticationStatus']);
      _authState = event;
    });
  }

  Future<void> initEnvironment() async {
    Log.d(TAG, 'initialise env', references: ['initEnvironment']);
    await getStatus();
  }

  Future<AuthenticationStatus> getStatus() async {
    Log.d(TAG, 'getAuthStatus', references: ['getStatus']);

    String? token = await _secureStorageService.getAccessToken();

    if (token != null) {
      await _api.fresh.setToken(OAuth2Token(accessToken: token));
      _authState = AuthenticationStatus.authenticated;
    } else {
      await _api.fresh.clearToken();
      _authState = AuthenticationStatus.unauthenticated;
    }

    Log.d(TAG, '$authState', references: ['getStatus']);
    return authState;
  }
}
