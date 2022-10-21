import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';
import 'package:cheffy/ui/widgets/app_form_field.dart';

import 'register_view_model.dart';

class RegisterPhoneView extends ViewModelWidget<RegisterViewModel> {
  const RegisterPhoneView({super.key});

  @override
  Widget build(BuildContext context, RegisterViewModel viewModel) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            42,
            getValueForScreenType(context: context, mobile: 16, tablet: 36),
            42,
            getValueForScreenType(context: context, mobile: 16, tablet: 36),
          ),
          child: ReactiveForm(
            formGroup: viewModel.phoneForm,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Create Account',
                          style: AppStyle.of(context).b1B.wCChineseBlack,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                          style: AppStyle.of(context).b4.wCRhythm,
                        ),
                        const SizedBox(height: 64),
                        AppFormField(
                          label: 'Enter your phone number',
                          field: ReactivePhoneFormField(
                            formControlName: viewModel.controls.phone,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.soap,
                                hintText: 'E.g. 64888 88245'),
                          ),
                        ),
                        const SizedBox(height: 64),
                        ElevatedButton(
                          onPressed: viewModel.onSubmitOtp,
                          child: const Text('Send OTP'),
                        ),
                        SizedBox(
                          height: getValueForScreenType(
                              context: context, mobile: 16, tablet: 36),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account?',
                      style: AppStyle.of(context).b4.wCRhythm,
                    ),
                    TextButton(
                      onPressed: viewModel.onLogin,
                      child: Text(
                        'Login',
                        style: AppStyle.of(context).b4M.wCPlumpPurplePrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
