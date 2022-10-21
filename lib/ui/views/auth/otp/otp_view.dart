import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_pin_code_fields/reactive_pin_code_fields.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';

import 'otp_view_model.dart';

class OTPView extends ViewModelBuilderWidget<OTPViewModel> {
  const OTPView({super.key});

  @override
  Widget builder(BuildContext context, OTPViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            42,
            42,
            42,
            getValueForScreenType(context: context, mobile: 16, tablet: 36),
          ),
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
                          'We send OTP on +1 846 564 8945',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: viewModel.onWrongNumber,
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: const Text('Wrong number?'),
                          ),
                        ),
                        const SizedBox(height: 64),
                        ReactivePinCodeTextField(
                          formControlName: viewModel.controls.pin,
                          length: 4,
                          enableActiveFill: true,
                          enablePinAutofill: true,
                          textStyle: AppStyle.of(context).b4M.wCWhite,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            fieldWidth: 60,
                            fieldHeight: 68,
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
                            Text('0.${viewModel.seconds} sec'),
                            TextButton(
                              onPressed: viewModel.onSendAgain,
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
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
    );
  }

  @override
  OTPViewModel viewModelBuilder(BuildContext context) => OTPViewModel();
}
