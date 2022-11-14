import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';

import '../../../app/app.locator.dart';
import '../../../core/services/api/api_client.dart';

class ApiProvider {
  // ignore: constant_identifier_names
  static const String TAG = 'ApiProvider';

  final ApiClient _apiClient = locator.get();

  @override
  Fresh<OAuth2Token> get fresh => _apiClient.fresh;

  @override
  Future<List<LocationEntity>> locations() async {
    final result = await _apiClient.get('location');
    return ((result.data) as List)
        .map((e) => LocationEntity.fromJson(e))
        .toList();
  }
}
