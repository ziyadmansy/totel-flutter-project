import 'dart:async';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms/reactive_forms.dart' as rf;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';

class OTPViewModel extends BaseViewModel {
  // ignore: constant_identifier_names
  static const String TAG = 'OTPViewModel';
  final NavigationService _navigationService = locator.get();
  final controls = _Controls();
  late final Timer timer;

  late final FormGroup form;
  int _seconds = 60;

  OTPViewModel() {
    form = FormGroup({
      controls.pin: FormControl(validators: [rf.Validators.required]),
    });
    timer = Timer.periodic(const Duration(seconds: 1), _onTimerTick);
  }

  //region getters setters
  int get seconds => _seconds;

  set seconds(int seconds) {
    _seconds = seconds;
    notifyListeners();
  }

  //endregion

  void onSubmit() {}

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
