import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/modules/about/domain/entities/about_entity.dart';
import 'package:cheffy/modules/about/domain/repositories/about_repo.dart';

class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl(this._apiClient);

  final ApiClient _apiClient;
  
  @override
  Future<AboutEntity> getPrivacyPolicy() {
    // TODO: implement getPrivacyPolicy
    throw UnimplementedError();
  }
  
  @override
  Future<AboutEntity> getTermsAndConditions() {
    // TODO: implement getTermsAndConditions
    throw UnimplementedError();
  }

}
