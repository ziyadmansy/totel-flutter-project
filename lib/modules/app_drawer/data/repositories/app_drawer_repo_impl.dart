import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/modules/app_drawer/domain/entities/help_entity.dart';
import 'package:cheffy/modules/app_drawer/domain/repositories/app_drawer_repo.dart';

class AppDrawerRepoImpl implements AppDrawerRepo {
  AppDrawerRepoImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<HelpEntity>> getHelpMenu() async {
    final res = await _apiClient.get(ApiRoutes.help);
    return (res.data as List).map((help) => HelpEntity.fromMap(help)).toList();
  }
}
