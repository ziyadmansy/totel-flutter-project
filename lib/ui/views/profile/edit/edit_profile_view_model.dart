import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends BaseViewModel {
  final controls = _Controls();

  late final FormGroup form;

  bool _isMalePartner = true;
  bool _isFemalePartner = true;

  EditProfileViewModel() {
    form = FormGroup({
      controls.fullName: FormControl(validators: [Validators.required]),
      controls.email: FormControl(validators: [Validators.required]),
      controls.phoneNumber:
          FormControl<String>(validators: [Validators.required]),
      controls.occupation:
          FormControl<double>(validators: [Validators.required]),
      controls.bio: FormControl(validators: [Validators.required]),
      controls.dob: FormControl(validators: [Validators.required]),
      controls.city: FormControl(validators: [Validators.required]),
    });
  }

  //region getters setters

  bool get isMalePartner => _isMalePartner;

  set isMalePartner(bool isMalePartner) {
    _isMalePartner = isMalePartner;
    notifyListeners();
  }

  bool get isFemalePartner => _isFemalePartner;

  set isFemalePartner(bool isFemalePartner) {
    _isFemalePartner = isFemalePartner;
    notifyListeners();
  }

  //endregion

  void onTapMalePartner(bool val) => isMalePartner = !val;

  void onTapFemalePartner(bool val) => isFemalePartner = !val;

  void onSave() {}

  void settings() {}
}

class _Controls {
  String get fullName => 'full_name';

  String get email => 'email';

  String get phoneNumber => 'phone_number';

  String get occupation => 'occupation';

  String get bio => 'bio';

  String get dob => 'dob';

  String get city => 'city';
}
