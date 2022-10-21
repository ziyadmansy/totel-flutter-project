import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class RequestViewModel extends BaseViewModel {
  final controls = _Controls();

  late final FormGroup form;

  RequestViewModel() {
    form = FormGroup({
      controls.date: FormControl(validators: [Validators.required]),
      controls.hours: FormControl<String>(validators: [Validators.required]),
    });
  }

  //region getters setters
  bool _isForDays = true;

  bool get isForDays => _isForDays;

  set isForDays(bool isForDays) {
    _isForDays = isForDays;
    notifyListeners();
  }

  //endregion

  void onTapRequirementType() {
    isForDays = !isForDays;
  }

  void onBrowse() {}

  void onSubmit() {}
}

class _Controls {
  String get date => 'date';

  String get hours => 'hours';
}
