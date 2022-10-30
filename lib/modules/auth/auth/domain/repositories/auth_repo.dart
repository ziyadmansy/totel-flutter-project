import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/core/models/response/login_entity.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failure, ProfileEntity>> login(
      String username, String password);

  Future<String> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  Future<void> sendOtp({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) onVerificationCompleted,
    required void Function(FirebaseAuthException) onVerificationFailed,
    required void Function(String, int?) onCodeSent,
    required void Function(String) onCodeAutoRetrievalTimeout,
    int? forceResendingToken,
  });

  Future<void> signInWithGoogle();

  Future<void> signInWithFacebook();

  Future<void> logout();
}
