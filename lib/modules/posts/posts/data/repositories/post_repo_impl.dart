import 'dart:convert';

import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_finding_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/share_room_post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/repositories/post_repo.dart';
import 'package:dio/dio.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_booked_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/attachment_entity.dart';
import 'package:image_picker/image_picker.dart';

class PostRepoImpl implements PostRepo {
  PostRepoImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<void> createBookedPost(CreateBookedPostParams params,
      {List<XFile> files = const []}) async {
    try {
      final List<int> attachments = [];

      if (files.isNotEmpty) {
        attachments.addAll(await _uploadAttachments(files));
      }
      final body = params.copyWith(attachments: attachments).toJson();

      print(jsonEncode(body));
      final res = await _apiClient.post('post', data: body);
      return;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FindingPartnerPostsEntity> getAllFindingPartnerPosts() async {
    final res = await _apiClient.get(ApiRoutes.findingPartnerPosts);
    return FindingPartnerPostsEntity.fromMap(res.data);
  }

  @override
  Future<ShareRoomPostEntity> getAllShareRoomPosts() async {
    final res = await _apiClient.get(ApiRoutes.shareRoomPosts);
    return ShareRoomPostEntity.fromMap(res.data);
  }

  @override
  Future<AttachmentEntity> uploadAttachment(
      String path, String fileName) async {
    FormData data = FormData.fromMap(
      {"file": await MultipartFile.fromFile(path, filename: fileName)},
    );
    final result = await _apiClient.post(
      'attachment',
      data: data,
    );
    return AttachmentEntity.fromJson(result.data);
  }

  Future<List<int>> _uploadAttachments(List<XFile>? attachments) async {
    if (attachments != null) {
      final List<int> result = [];
      for (var att in attachments) {
        try {
          var res = await uploadAttachment(att.path, att.name);
          result.add(res.id);
        } catch (e) {
          rethrow;
        }
      }
      return result;
    }

    return [];
  }

  @override
  Future<void> createFindingPost(CreateFindingPartnerPostParams entity) async {
    final data = entity.toMap();

    await _apiClient.post(
      ApiRoutes.findingPartnerPosts,
      data: data,
    );
  }

  @override
  Future<List<HotelEntity>> getFilteredHotels(String name) async {
    final res = await _apiClient.get(ApiRoutes.filteredHotels(name: name));
    final List<HotelEntity> hotels =
        (res.data as List).map((e) => HotelEntity.fromMap(e)).toList();
    return hotels;
  }
}
