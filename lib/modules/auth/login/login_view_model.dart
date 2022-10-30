import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:cheffy/modules/main/map/map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final AuthRepo authRepo;
  final SnackbarService _snackbarService = locator.get();

  final controls = _Controls();

  late final FormGroup form;

  bool _obscureText = true;

  LoginViewModel(
    this.authRepo,
  ) {
    form = FormGroup({
      controls.username: FormControl(
          value: 'usertest@gmail.com', asyncValidators: [_usernameValidation]),
      controls.password:
          FormControl(value: '123456', validators: [Validators.required]),
    });
  }

  //region getters setters

  bool get obscureText => _obscureText;

  set obscureText(bool obscureText) {
    _obscureText = obscureText;
    notifyListeners();
  }

  //endregion

  Future<Map<String, dynamic>?> _usernameValidation(
      AbstractControl<dynamic> control) async {
    final emailError = {'Invalid email address': false};
    final phoneError = {'Invalid phone number': false};

    var error = Validators.required(control);

    if (error != null) {
      return error;
    }

    // email validation
    if (control.value is String && (control.value as String).contains('@')) {
      control.markAsTouched();
      return Validators.email(control);
    }

    RegExp exp = RegExp(r'[\s\d\+]+');
    if (exp.allMatches((control.value as String)).isNotEmpty) {
      try {
        var phoneNumber = PhoneNumber.fromRaw(control.value);
        if (!phoneNumber.validate(type: PhoneNumberType.mobile)) {
          control.markAsTouched();
          return phoneError;
        }
      } catch (e) {
        control.markAsTouched();
        return phoneError;
      }
    }

    return null;
  }

  Future<void> onSubmit() async {
    if (form.valid) {
      setBusy(true);
      final result = await authRepo.login(form.control(controls.username).value,
          form.control(controls.password).value);
      result.fold(
        (l) {
          _snackbarService.showSnackbar(
            title: 'Wrong Credentials',
            message: 'E-mail or password is wrong',
          );
        },
        (r) {
          _navigationService.clearStackAndShow(Routes.mainView);
        },
      );
      setBusy(false);
    } else {
      form.markAllAsTouched();
    }
  }

  void onGoogle() async {
    try {
      await authRepo.signInWithGoogle();
      _navigationService.navigateToMainView();
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    }
  }

  void onFacebook() async {
    try {
      await authRepo.signInWithGoogle();
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    }
  }

  void onRegister() => _navigationService.navigateToRegisterView();

  void onShowPassword() => obscureText = !obscureText;

  void onResetPassword() {}
}

class _Controls {
  String get username => 'username';

  String get password => 'password';
}
