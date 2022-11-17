import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/app/constants/error_messages.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/exceptions/custom_exceptions.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/secure_storage_service.dart';
import 'package:cheffy/modules/auth/auth/data/remote/models/login_data_model.dart';
import 'package:cheffy/modules/main/profile/profile/domain/repositories/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiClient _apiClient = locator.get();
  final SecureStorageService _secureStorageService = locator.get();
  final NavigationService _navigationService = locator.get();
  final SnackbarService _snackbarService = locator.get();

  Future<void> login(String username, String password) async {
    try {
      final result = await _apiClient.post(
        ApiRoutes.login,
        data: {
          'username': username,
          'password': password,
        },
      );
      final statusCode = result.statusCode!;
      if (statusCode == 201) {
        final loginResult = LoginDataModel.fromMap(result.data);
        await _secureStorageService.setAccessToken(loginResult.accessToken);

        await _apiClient.fresh
            .setToken(OAuth2Token(accessToken: loginResult.accessToken));
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        throw InvalidEmailOrPasswordException();
      }
      print('on DioError catch ($e)');
      throw UnExpectedException();
    } catch (e) {
      print('catch ($e)');
      throw UnExpectedException();
    }
  }

  @override
  Future<String> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      print(ApiRoutes.register);
      final result = await _apiClient.post(
        ApiRoutes.register,
        data: {
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      final statusCode = result.statusCode;
      print(statusCode);
      print(result.data);
      if (statusCode == 201) {
        final registerMsg = result.data['message'];
        return registerMsg;
      } else {
        throw UnExpectedException();
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
      print(e.error);
      if (e.response?.statusCode == 400) {
        throw UserAlreadyRegisteredException();
      }
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> sendOtp({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) onVerificationCompleted,
    required void Function(FirebaseAuthException) onVerificationFailed,
    required void Function(String, int?) onCodeSent,
    required void Function(String) onCodeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    // Send OTP is only sent during registration
    // Thats why I only call register()
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: onCodeSent,
      forceResendingToken: forceResendingToken,
      codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }

  // google login
  Future<void> signInWithGoogle() async {
    try {
      final _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          print('New Google Account created Successfully');
        } else {
          print('Existing Google Account Logged in Successfully');
        }
      }
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? ErrorMessages.somethingWentWrong);
    }
  }

// facebook login
  Future<void> signInWithFacebook() async {
    // try {
    //   final _auth = FirebaseAuth.instance;
    //   final LoginResult loginResult = await FacebookAuth.instance.login();

    //   final OAuthCredential facebookCredential =
    //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

    //   await _auth.signInWithCredential(facebookCredential);
    // } on FirebaseAuthException catch (e) {
    //   return Future.error(e.message ?? ErrorMessages.somethingWentWrong);
    // }
  }

  @override
  Future<void> logout() async {
    final result = await _apiClient.post(ApiRoutes.logout);
    final statusCode = result.statusCode;
    if (statusCode == 201) {
      await _secureStorageService.setAccessToken(null);
      await _secureStorageService.setRefreshToken(null);
      // await _secureStorageService.setAppUser(null);
      await _apiClient.fresh.clearToken();
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}
