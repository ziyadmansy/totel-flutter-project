import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/modules/profile/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiClient _apiClient;

  ProfileRepoImpl(this._apiClient);

  @override
  Future<Either<Failure, ProfileEntity>> get() async {
    try {
      final result = await _apiClient.get('user/profile');
      final resultData = result.data;
      return right(ProfileEntity.fromJson(resultData));
    } on DioError catch (e) {
      throw e;
      return left(ServerFailure());
    } catch (e) {
      throw e;

      return left(UnExpectedFailure());
    }
  }
}
