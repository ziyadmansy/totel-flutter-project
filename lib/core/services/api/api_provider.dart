import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/core/models/data/post_entity.dart';
import 'package:cheffy/core/models/request/create_post_entity.dart';
import 'package:cheffy/core/models/response/base_entity.dart';
import 'package:cheffy/core/models/response/login_entity.dart';
import 'package:cheffy/core/models/response/posts_entity.dart';

import '../../../app/app.locator.dart';
import '../../../core/services/api/api.dart';
import '../../../core/services/api/api_client.dart';
import '../../models/response/profile_entity.dart';
import '../../models/response/upload_attachment_entity.dart';

class ApiProvider implements Api {
  // ignore: constant_identifier_names
  static const String TAG = 'ApiProvider';

  final ApiClient _apiClient = locator.get();

  @override
  Fresh<OAuth2Token> get fresh => _apiClient.fresh;

  @override
  Future<LoginEntity> login(String username, String password) {
    return _apiClient.post<LoginEntity, LoginEntity>('auth/login', data: {
      'username': username,
      'password': password,
    });
  }

  @override
  Future<BaseEntity> createPost(CreatePostEntity entity) {
    return _apiClient.post<BaseEntity, BaseEntity>('post', data: entity);
  }

  @override
  Future<PostsEntity> posts() {
    return _apiClient.get<PostsEntity, PostsEntity>('post');
  }

  @override
  Future<List<PostEntity>> post(int postId) {
    return _apiClient.get<PostEntity, List<PostEntity>>('post/$postId');
  }

  @override
  Future<ProfileEntity> profile() {
    return _apiClient.get<ProfileEntity, ProfileEntity>('user/profile');
  }

  @override
  Future<List<LocationEntity>> locations() {
    return _apiClient.get<LocationEntity, List<LocationEntity>>('location');
  }

  @override
  Future<UploadAttachmentEntity> uploadAttachment(
      String path, String fileName) async {
    FormData data = FormData.fromMap(
      {"file": await MultipartFile.fromFile(path, filename: fileName)},
    );

    return _apiClient.post<UploadAttachmentEntity, UploadAttachmentEntity>(
      'attachment',
      data: data,
    );
  }

  @override
  Future<List<BiddingEntity>> biddings() {
    return _apiClient.get<BiddingEntity, List<BiddingEntity>>('bidding');
  }
}
