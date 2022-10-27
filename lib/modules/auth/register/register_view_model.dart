import 'package:cheffy/core/exceptions/custom_exceptions.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class RegisterViewModel extends BaseViewModel {
  RegisterViewModel(this.authRepo);

  final NavigationService _navigationService = locator.get();
  final SnackbarService _snackbarService = locator.get();

  static const int navKey = 2;
  final controls = _Controls();

  final AuthRepo authRepo;

  final FormGroup phoneForm = FormGroup({
    _Controls().phone: FormControl(validators: [Validators.required]),
  });

  final FormGroup accountForm = FormGroup({
    _Controls().firstName: FormControl(validators: [Validators.required]),
    _Controls().lastName: FormControl(validators: [Validators.required]),
    _Controls().email: FormControl(validators: [
      Validators.required,
      Validators.email,
    ]),
    _Controls().password:
        FormControl(validators: [Validators.required, Validators.minLength(6)]),
  });

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
        final registerMsg = await authRepo.register(
          email: accountForm.control(controls.email).value,
          password: accountForm.control(controls.password).value,
          firstName: accountForm.control(controls.firstName).value,
          lastName: accountForm.control(controls.lastName).value,
        );
        _snackbarService.showSnackbar(message: registerMsg);
        _navigationService.clearStackAndShow(Routes.loginView);
      } else {
        accountForm.markAllAsTouched();
      }
    } on UserAlreadyRegisteredException catch (e) {
      _snackbarService.showSnackbar(message: 'User is already registered');
    } finally {
      setBusy(false);
    }
  }

  void onLogin() => _navigationService.back();
}

class _Controls {
  String get phone => 'phone';

  String get firstName => 'first_name';

  String get lastName => 'last_name';

  String get email => 'email';

  String get password => 'password';
}
