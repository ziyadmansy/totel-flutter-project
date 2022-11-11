import 'package:cheffy/Models/occupation.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/modules/profile/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiClient _apiClient = locator.get();

  @override
  Future<ProfileEntity> get() async {
    try {
      final result = await _apiClient.get(ApiRoutes.profile);
      final resultData = result.data;

      return ProfileEntity.fromJson(resultData);
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
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
  Future<ProfileEntity> update(ProfileEntity profileEntity) async {
    try {
      final result = await _apiClient.put(
        ApiRoutes.profile,
        data: profileEntity.toJson(),
      );
      final resultData = result.data;

      return ProfileEntity.fromJson(resultData);
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
