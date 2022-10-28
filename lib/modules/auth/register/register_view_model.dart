import 'package:cheffy/core/exceptions/custom_exceptions.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class RegisterViewModel extends BaseViewModel {
  RegisterViewModel(this.authRepo) {
    accountForm = FormGroup({
      controls.firstName: FormControl<String>(validators: [
        Validators.required,
      ]),
      controls.lastName: FormControl<String>(validators: [
        Validators.required,
      ]),
      controls.email: FormControl<String>(validators: [
        Validators.required,
        Validators.email,
      ]),
      controls.password: FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(6),
      ]),
      controls.confirmPassword: FormControl<String>(),
      controls.phone: FormControl<PhoneNumber>(validators: [
        Validators.required,
        // Validators.maxLength(12),
        // Validators.minLength(10),
      ]),
    }, validators: [
      Validators.mustMatch(controls.password, controls.confirmPassword),
    ]);
  }

  final NavigationService _navigationService = locator.get();
  final SnackbarService _snackbarService = locator.get();

  FirebaseAuth auth = FirebaseAuth.instance;

  static const int navKey = 2;
  final controls = _Controls();

  final AuthRepo authRepo;

  late FormGroup accountForm;

  String _verificationId = "";
  int? _resendToken;

  bool _obscureText = true;

  //region getters setters

  bool get obscureText => _obscureText;

  set obscureText(bool obscureText) {
    _obscureText = obscureText;
    notifyListeners();
  }

  //endregion

  void onShowPassword() => obscureText = !obscureText;

  void onSubmitOtp() => _navigationService.navigateToNestedRegisterFormView(
      routerId: RegisterViewModel.navKey);

  void onRegisterSubmit() async {
    try {
      print(accountForm.valid);
      if (accountForm.valid) {
        setBusy(true);
        final phoneNumberWithCountryCode = '+' +
            accountForm.control(controls.phone).value.countryCode +
            accountForm.control(controls.phone).value.nsn;
        print(phoneNumberWithCountryCode);
        await authRepo.sendOtp(
          phoneNumber: phoneNumberWithCountryCode,
          onVerificationCompleted: (PhoneAuthCredential credential) async {
            print('verificationCompleted');
            print(credential.asMap());

            await auth.signInWithCredential(credential);
            await authRepo.register(
              email: accountForm.control(controls.email).value,
              password: accountForm.control(controls.password).value,
              firstName: accountForm.control(controls.firstName).value,
              lastName: accountForm.control(controls.lastName).value,
            );
            _navigationService.clearStackAndShow(Routes.loginView);
          },
          onVerificationFailed: (FirebaseAuthException e) {
            print('verificationFailed');
            print(e.message);
            print(e.code);
            _snackbarService.showSnackbar(
              title: "Wrong Credentials - ${e.code}",
              message: "${e.message}",
            );
          },
          onCodeSent: (String verificationId, int? resendToken) async {
            print(
                'onCodeSent: verificationId: $verificationId, resendToken: $resendToken');

            _verificationId = verificationId;
            _resendToken = resendToken;

            final otpArg = await _navigationService.navigateToOTPView();

            await signInWithFirebaseCredentials(otpArg);
          },
          forceResendingToken: _resendToken,
          onCodeAutoRetrievalTimeout: (String verificationId) {
            verificationId = _verificationId;
          },
        );
      } else {
        accountForm.markAllAsTouched();
      }
    } on UserAlreadyRegisteredException catch (e) {
      _snackbarService.showSnackbar(message: 'User is already registered');
    } on FirebaseAuthException catch (e) {
      _snackbarService.showSnackbar(
        title: 'Wrong OTP',
        message: 'Wrong OTP, please try again',
      );
    } catch (e) {
      _snackbarService.showSnackbar(
        title: 'Error',
        message: 'Something went wrong, please try again',
      );
    } finally {
      setBusy(false);
    }
  }

  void onLogin() => _navigationService.back();

  Future<void> signInWithFirebaseCredentials(String otp) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp.toString(),
    );
    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);

    final registerMsg = await authRepo.register(
      email: accountForm.control(controls.email).value,
      password: accountForm.control(controls.password).value,
      firstName: accountForm.control(controls.firstName).value,
      lastName: accountForm.control(controls.lastName).value,
    );
    _snackbarService.showSnackbar(message: registerMsg);
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}

class _Controls {
  String get phone => 'phone';

  String get firstName => 'first_name';

  String get lastName => 'last_name';

  String get email => 'email';

  String get password => 'password';
  String get confirmPassword => 'confirmPassword';
}
