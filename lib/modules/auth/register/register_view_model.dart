import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final navKey = 2;
  final controls = _Controls();

  late final FormGroup phoneForm;
  late final FormGroup accountForm;

  bool _obscureText = true;

  RegisterViewModel() {
    phoneForm = FormGroup({
      controls.phone: FormControl(validators: [Validators.required]),
    });
    accountForm = FormGroup({
      controls.name: FormControl(validators: [Validators.required]),
      controls.email: FormControl(validators: [Validators.required]),
      controls.password: FormControl(validators: [Validators.required]),
    });
  }

  //region getters setters

  bool get obscureText => _obscureText;

  set obscureText(bool obscureText) {
    _obscureText = obscureText;
    notifyListeners();
  }

  //endregion

  void onShowPassword() => obscureText = !obscureText;

  void onSubmitOtp() => _navigationService.navigateToOTPView().then(
        (value) => _navigationService.navigateToNestedRegisterFormView(
          routerId: navKey,
        ),
      );

  void onSubmit() => _navigationService.back();

  void onLogin() => _navigationService.back();
}

class _Controls {
  String get phone => 'phone';

  String get name => 'name';

  String get email => 'email';

  String get password => 'password';
}
