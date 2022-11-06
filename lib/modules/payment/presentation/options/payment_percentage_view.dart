import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class PaymentPercentageView extends ViewModelWidget<PaymentViewModel> {
  const PaymentPercentageView({super.key});

  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      body: ReactiveForm(
        formGroup: viewModel.paymentPercentageForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            children: [
              Text(
                'Total Payment',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '\$50',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ListTile(
                title: Text(
                  'I will pay',
                  style: TextStyle(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.all(0),
              ),
              ReactiveDropdownField(
                formControlName: viewModel.controls.paymentPercentage,
                hint: Text('Percentage'),
                validationMessages: {
                  ValidationMessage.required: (val) =>
                      'Enter payment percentage',
                },
                items: [
                  DropdownMenuItem<int>(
                    value: 10,
                    child: Text('10%'),
                  ),
                  DropdownMenuItem<int>(
                    value: 30,
                    child: Text('30%'),
                  ),
                  DropdownMenuItem<int>(
                    value: 50,
                    child: Text('50%'),
                  ),
                  DropdownMenuItem<int>(
                    value: 70,
                    child: Text('70%'),
                  ),
                  DropdownMenuItem<int>(
                    value: 100,
                    child: Text('100%'),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SharedWidgets.buildRoundedElevatedButton(
                  btnChild: Text('Proceed'),
                  onPress: viewModel.onPaymentPercentageProceed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
