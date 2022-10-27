import 'package:cheffy/modules/about/domain/entities/about_entity.dart';

abstract class AboutRepository {
  Future<AboutEntity> getPrivacyPolicy();
  Future<AboutEntity> getTermsAndConditions();
}
