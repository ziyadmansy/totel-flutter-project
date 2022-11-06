import 'package:cheffy/modules/payment/data/models/roommate_model.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';

class PaymentViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  late final FormGroup couponForm;
  late final FormGroup paymentPercentageForm;
  late final FormGroup creditCardForm;
  final controls = _Controls();

  List<RoommateModel> roommates = [
    RoommateModel(
      id: 1,
      imgUrl:
          'https://thumbs.dreamstime.com/b/portrait-happy-pre-teen-girl-outdoor-31049011.jpg',
      name: 'Annete Black',
      occupation: 'Doctor',
      email: 'test@test.com',
      contactNo: '202-555-0190',
    ),
    RoommateModel(
      id: 2,
      imgUrl:
          'https://thumbs.dreamstime.com/z/happy-teen-girl-big-smile-15918832.jpg',
      name: 'Annete Black',
      occupation: 'Doctor',
      email: 'test@test.com',
      contactNo: '202-555-0190',
    ),
  ];

  PaymentViewModel() {
    couponForm = FormGroup({
      controls.coupon: FormControl(),
    });
    paymentPercentageForm = FormGroup({
      controls.paymentPercentage: FormControl<int>(
        validators: [
          Validators.required,
        ],
      ),
    });
    creditCardForm = FormGroup({
      controls.cardNumber: FormControl(),
      controls.mmYY: FormControl(),
      controls.cvv: FormControl(),
      controls.name: FormControl(),
      controls.save: FormControl<bool>(),
    });
  }

  void switchExpansionState(int i, bool isExpanded) {
    roommates[i].isExpanded = !roommates[i].isExpanded;
    notifyListeners();
  }

  //////////////////  Book a room Screen  //////////////////
  // Confirm and Pay Button (Goes to payment options)
  void onPay() => _navigationService.navigateToPaymentOptionsView();
  void onRoommateAdd() =>
      _navigationService.navigateTo(Routes.paymentPercentageView);

  //////////////////  Payment Percentage Screen  //////////////////
  // Proceed Button Click
  void onPaymentPercentageProceed() {
    if (paymentPercentageForm.valid) {
      _navigationService.navigateTo(Routes.paymentOptionsView);
    } else {
      paymentPercentageForm.markAllAsTouched();
    }
  }

  //////////////////  Payment Options Screen  //////////////////
  // Debit/Credit Card Payment Option
  void onAddCard() => _navigationService.navigateToPaymentAddCartView();

  void onBank() {}

  void onWallet() {}

  void onVenom() {}

  void onPlatformPay() {}

  //////////////////  Add Credit Card Screen  //////////////////
  void onCreditCardProceed() {}
}

class _Controls {
  String get coupon => 'coupon';

  String get cardNumber => 'card_number';

  String get mmYY => 'mm_yy';

  String get cvv => 'cvv';

  String get name => 'name';

  String get save => 'save';

  String get paymentPercentage => 'payment_percentage';
}
