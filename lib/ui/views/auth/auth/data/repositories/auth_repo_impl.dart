import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/core/models/response/login_entity.dart';
import 'package:cheffy/ui/views/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/ui/views/auth/auth/data/remote/data_sources/auth_remote_data_source.dart';
import 'package:cheffy/ui/views/auth/auth/domain/repositories/auth_repo.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/exceptions/auth_exceptions.dart';
import 'package:cheffy/core/models/response/login_entity.dart';
import 'package:cheffy/ui/views/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/core/services/api/api.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_provider.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';
import 'package:cheffy/ui/views/auth/auth/data/remote/models/login_data_model.dart';
import 'package:cheffy/ui/views/profile/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.profileRepo);

  final ProfileRepo profileRepo;
  final ApiClient _apiClient = locator.get();
  final SecureStorageService _secureStorageService = locator.get();

  Future<Either<Failure, ProfileEntity>> login(
      String username, String password) async {
    try {
      final result = await _apiClient.post('auth/login', data: {
        'username': username,
        'password': password,
      });
      final statusCode = result.statusCode!;
      if (statusCode == 201) {
        final loginResult = LoginDataModel.fromMap(result.data);
        await _secureStorageService.setAccessToken(loginResult.accessToken);
        // await _secureStorageService.setRefreshToken(value.refreshToken);
        await _apiClient.fresh
            .setToken(OAuth2Token(accessToken: loginResult.accessToken));

        final profile = await profileRepo.get();
        return profile.fold((l) {
          print('profile.fold((l)');

          return left(l);
        }, (r) async {
          await _secureStorageService.setAppUser(r);
          return right(r);
        });
      }
      print('/////////////////////////');
      return left(UnExpectedFailure());
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return left(InvalidEmailOrPasswordFailure());
      }
      print('on DioError catch (e)');

      return left(UnExpectedFailure());
    } catch (e) {
      print('catch (e)');

      return left(UnExpectedFailure());
    }
  }
/*
  @override
  Future<LoginEntity> login(String username, String password) async {
    try {
      var response = await remoteDataSource.login(username, password);
      if (response.statusCode == null && response.message == null) {
        if (response.accessToken != null) {

          return response.accessToken!;
        } else {
          return Future.error(ErrorMessages.unexpectedErrorOccurred);
        }
      } else {
        return Future.error(
            response.message ?? ErrorMessages.somethingWentWrong);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
*/

}
