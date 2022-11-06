import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class PaymentDetailsPage extends ViewModelWidget<PaymentViewModel> {
  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    return ReactiveForm(
      formGroup: viewModel.couponForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Trip Details',
                      style: AppStyle.of(context).b2B.wCChineseBlack,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          'Date',
                          style: AppStyle.of(context).b3M.wCChineseBlack,
                        ),
                        Text(
                          '22 - 28 June',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          'Guests',
                          style: AppStyle.of(context).b3M.wCChineseBlack,
                        ),
                        Text(
                          '1 M, 1 F',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: AppColors.soap, thickness: 3),
                    const SizedBox(height: 16),
                    Text(
                      'Amount Details',
                      style: AppStyle.of(context).b2B.wCChineseBlack,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '(Original price \$300 Night / 3 = \$100 PP)',
                      style: AppStyle.of(context).b4.wCRhythm,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          '\$100 X 5 Night - 1st guest ',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                        Text(
                          '\$500',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          '\$100 X 5 Night - 2nd guest ',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                        Text(
                          '\$500',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          'Service charge 5%',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                        Text(
                          '\$50',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          'Total amount',
                          style: AppStyle.of(context).b4M.wCChineseBlack,
                        ),
                        Text(
                          '\$1050',
                          style: AppStyle.of(context).b4M.wCChineseBlack,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: AppColors.soap, thickness: 1),
                    const SizedBox(height: 16),
                    ReactiveTextField(
                      formControlName: viewModel.controls.coupon,
                      decoration: const InputDecoration(
                        labelText: 'Enter a coupon',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 12,
                  color: Theme.of(context).colorScheme.shadow,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: viewModel.onPay,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Confirm and Pay'),
                  SizedBox(width: 8),
                  Text('\$1050'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
