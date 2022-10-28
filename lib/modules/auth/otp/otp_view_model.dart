import 'dart:async';

import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/exceptions/custom_exceptions.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';

class OTPViewModel extends BaseViewModel {
  // ignore: constant_identifier_names
  static const String TAG = 'OTPViewModel';
  final NavigationService _navigationService = locator.get();
  final SnackbarService _snackbarService = locator.get();

  final controls = _Controls();
  late final Timer timer;

  final AuthRepo authRepo;

  late final FormGroup form;
  int _seconds = 60;

  OTPViewModel(this.authRepo) {
    form = FormGroup({
      controls.pin: FormControl(
        validators: [
          Validators.required,
          Validators.number,
          Validators.minLength(6),
        ],
      ),
    });
    timer = Timer.periodic(const Duration(seconds: 1), _onTimerTick);
  }

  //region getters setters
  int get seconds => _seconds;

  set seconds(int seconds) {
    _seconds = seconds;
    notifyListeners();
  }

  void onSubmit() async {
    try {
      if (form.valid) {
        print('Pin: ' + form.control(controls.pin).value);
        _navigationService.back(result: form.control(controls.pin).value);
      } else {
        form.markAllAsTouched();
      }
    } on UserAlreadyRegisteredException catch (e) {
      _snackbarService.showSnackbar(message: 'User is already registered');
    }
  }

  void onWrongNumber() => _navigationService.back();

  void _onTimerTick(Timer timer) {
    if (seconds > 0) {
      seconds--;
    }
  }

  void onSendAgain() {}
}

class _Controls {
  String get pin => 'pin';
}
