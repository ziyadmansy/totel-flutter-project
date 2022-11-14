import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<void> login(
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
