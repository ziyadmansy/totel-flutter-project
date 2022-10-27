import 'dart:convert';

import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:cheffy/core/services/api/api.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/modules/about/domain/entities/about_entity.dart';
import 'package:cheffy/modules/about/domain/repositories/about_repo.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_finding_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/repositories/post_repo.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_booked_post_params.dart';
import 'package:cheffy/core/models/response/base_entity.dart';
import 'package:cheffy/core/models/response/posts_entity.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/upload_attachment_entity.dart';
import 'package:image_picker/image_picker.dart';

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
