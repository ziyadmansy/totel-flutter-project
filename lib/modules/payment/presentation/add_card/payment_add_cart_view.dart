import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';

class PaymentAddCartView extends ViewModelWidget<PaymentViewModel> {
  const PaymentAddCartView({super.key});

  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
      ),
      body: ReactiveForm(
        formGroup: viewModel.creditCardForm,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Total Payment',
                  style: AppStyle.of(context).b4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '\$1050',
                  style: AppStyle.of(context).b4B,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AppFormField(
                  label: 'Card',
                  field: ReactiveTextField(
                    formControlName: viewModel.controls.cardNumber,
                    decoration: const InputDecoration(
                      hintText: 'Enter your card number',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: AppFormField(
                        label: 'Expiry',
                        field: ReactiveTextField(
                          formControlName: viewModel.controls.mmYY,
                          decoration: const InputDecoration(
                            hintText: 'MM / YY',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppFormField(
                        label: 'CVV',
                        field: ReactiveTextField(
                          formControlName: viewModel.controls.cvv,
                          decoration: const InputDecoration(
                            hintText: 'Enter CVV',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AppFormField(
                  label: 'Name on Card',
                  field: ReactiveTextField(
                    formControlName: viewModel.controls.name,
                    decoration: const InputDecoration(
                      hintText: 'Enter your card number',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ReactiveCheckboxListTile(
                  formControlName: viewModel.controls.save,
                  title: Text(
                    'Secure this option for faster checkout',
                    style: AppStyle.of(context).b4.wCRhythm,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: viewModel.onCreditCardProceed,
                  child: const Text('Proceed'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
