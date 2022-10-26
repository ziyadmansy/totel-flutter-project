import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';

class PaymentAddCartViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final controls = _Controls();
  late final FormGroup form;

  PaymentAddCartViewModel() {
    form = FormGroup({
      controls.cardNumber: FormControl(),
      controls.mmYY: FormControl(),
      controls.cvv: FormControl(),
      controls.name: FormControl(),
      controls.save: FormControl<bool>(),
    });
  }

  void onProceed() {}
}

class _Controls {
  String get cardNumber => 'card_number';

  String get mmYY => 'mm_yy';

  String get cvv => 'cvv';

  String get name => 'name';

  String get save => 'save';
}
