import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/upload_attachment_entity.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_booked_post_params.dart';
import 'package:cheffy/core/models/response/base_entity.dart';
import 'package:cheffy/core/models/response/login_entity.dart';
import 'package:cheffy/core/models/response/posts_entity.dart';

import '../../../app/app.locator.dart';
import '../../../core/services/api/api.dart';
import '../../../core/services/api/api_client.dart';

class ApiProvider implements Api {
  // ignore: constant_identifier_names
  static const String TAG = 'ApiProvider';

  final ApiClient _apiClient = locator.get();

  @override
  Fresh<OAuth2Token> get fresh => _apiClient.fresh;

  // @override
  // Future<BaseEntity> create(CreateBookedPostParams entity) async {
  //   final res = await _apiClient.post('post', data: entity);
  //   return BaseEntity.fromJson(res.data);
  // }
  //
  // @override
  // Future<PostsEntity> get() async {
  //   final res = await _apiClient.get(
  //     'post',
  //   );
  //   return PostsEntity.fromMap(res.data);
  // }
  //
  // @override
  // Future<List<PostEntity>> add(int postId) async {
  //   final res = await _apiClient.get('post/$postId');
  //
  //   final x = ((res.data) as List).map((e) => PostEntity.fromJson(e)).toList();
  //   return (x);
  // }

  @override
  Future<List<LocationEntity>> locations() async {
    final result = await _apiClient.get('location');
    return ((result.data) as List)
        .map((e) => LocationEntity.fromJson(e))
        .toList();
  }

  // @override
  // Future<UploadAttachmentEntity> uploadAttachment(
  //     String path, String fileName) async {
  //   FormData data = FormData.fromMap(
  //     {"file": await MultipartFile.fromFile(path, filename: fileName)},
  //   );
  //
  //   final result = await _apiClient.post(
  //     'attachment',
  //     data: data,
  //   );
  //   return UploadAttachmentEntity.fromJson(result.data);
  // }

  @override
  Future<List<BiddingEntity>> biddings() async {
    final result = await _apiClient.get('bidding');
    return ((result.data) as List)
        .map((e) => BiddingEntity.fromMap(e))
        .toList();
  }
}
