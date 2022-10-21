import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class PaymentSummaryViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();
  final controls = _Controls();
  late final FormGroup form;

  PaymentSummaryViewModel() {
    form = FormGroup({controls.coupon: FormControl()});
  }

  void onPay() => _navigationService.navigateToPaymentOptionsView();
}

class _Controls {
  String get coupon => 'coupon';
}
