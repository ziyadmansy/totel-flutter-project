import 'dart:io';

import 'package:cheffy/Models/occupation.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/main/profile/profile/domain/entities/booking_entity.dart';
import 'package:cheffy/modules/main/profile/profile/domain/entities/review_entity.dart';
import 'package:cheffy/modules/main/profile/profile/domain/repositories/profile_repo.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/share_room_post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiClient _apiClient = locator.get();

  @override
  Future<UserEntity> get() async {
    try {
      final result = await _apiClient.get(ApiRoutes.profile);
      final resultData = result.data;

      return UserEntity.fromJson(resultData);
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<FindingPartnerPostsEntity> getUserFindingPartnerPosts() async {
    try {
      final result =
          await _apiClient.get(ApiRoutes.findingPartnerPostsByCurrentUser);
      final resultData = result.data;

      return FindingPartnerPostsEntity.fromMap(resultData);
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
  
  @override
  Future<ShareRoomPostEntity> getUserShareRoomPosts() async {
    try {
      final result =
          await _apiClient.get(ApiRoutes.shareRoomPostsByCurrentUser);
      final resultData = result.data;

      return ShareRoomPostEntity.fromMap(resultData);
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<List<ReviewEntity>> getUserReviews() async {
    try {
      final result = await _apiClient.get(ApiRoutes.userReviews);
      final resultData = result.data;

      return (resultData as List)
          .map((rev) => ReviewEntity.fromMap(rev))
          .toList();
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<List<BookingEntity>> getUserBookings() async {
    try {
      final result = await _apiClient.get(ApiRoutes.userBookings);
      final resultData = result.data;

      return (resultData['bookings'] as List)
          .map((book) => BookingEntity.fromMap(book))
          .toList();
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> deletePostById(int postId) async {
    await _apiClient.delete(ApiRoutes.deleteCurrentUserPost(postId));
  }

  @override
  Future<List<Occupation>> getOccupations() async {
    try {
      final result = await _apiClient.get(ApiRoutes.occupation);
      final resultData = result.data;

      return (resultData as List)
          .map((occ) => Occupation.fromMap(occ))
          .toList();
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<UserEntity> update(UserEntity profileEntity, {File? newAvatar}) async {
    try {
      Map<String, MultipartFile>? avatarMap;
      if (newAvatar != null) {
        String fileName = newAvatar.path.split('/').last;
        avatarMap = {
          "avatar": await MultipartFile.fromFile(
            newAvatar.path,
            filename: fileName,
          ),
        };
      }

      FormData formData = FormData.fromMap({
        ...profileEntity.toJson(),
        if (avatarMap != null) ...avatarMap,
      });

      final result = await _apiClient.put(
        ApiRoutes.profile,
        data: formData,
      );

      final resultData = result.data;

      return UserEntity.fromJson(resultData);
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
