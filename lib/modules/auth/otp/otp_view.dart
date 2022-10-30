import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_pin_code_fields/reactive_pin_code_fields.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

import 'otp_view_model.dart';

class OTPView extends ViewModelBuilderWidget<OTPViewModel> {
  const OTPView({super.key});

  @override
  Widget builder(BuildContext context, OTPViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: BackgroundProgress<OTPViewModel>(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ReactiveForm(
              formGroup: viewModel.form,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Enter OTP',
                            style: AppStyle.of(context).b1B.wCChineseBlack,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'We sent an OTP to your number',
                            style: AppStyle.of(context).b4.wCRhythm,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: viewModel.onWrongNumber,
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              child: const Text('Wrong number?'),
                            ),
                          ),
                          const SizedBox(height: 64),
                          ReactivePinCodeTextField(
                            formControlName: viewModel.controls.pin,
                            length: 6,
                            enableActiveFill: true,
                            enablePinAutofill: true,
                            textStyle: AppStyle.of(context).b4M.wCWhite,
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Pin code is missing',
                              ValidationMessage.number: (error) =>
                                  'Enter a valid number',
                              ValidationMessage.minLength: (error) =>
                                  'Pin code must be 6 digits',
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              fieldWidth: MediaQuery.of(context).size.width / 8,
                              fieldHeight: 60,
                              activeColor: AppColors.plumpPurplePrimary,
                              activeFillColor: AppColors.plumpPurplePrimary,
                              selectedColor: AppColors.rhythm,
                              selectedFillColor: AppColors.rhythm,
                              inactiveColor: AppColors.soap,
                              inactiveFillColor: AppColors.soap,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Text('${viewModel.seconds} sec.'),
                              TextButton(
                                onPressed: viewModel.onSendAgain,
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text('Send again'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 64),
                          ElevatedButton(
                            onPressed: viewModel.onSubmit,
                            child: const Text('Submit'),
                          ),
                          SizedBox(
                            height: getValueForScreenType(
                              context: context,
                              mobile: 16,
                              tablet: 36,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  OTPViewModel viewModelBuilder(BuildContext context) =>
      OTPViewModel(locator.get());
}
