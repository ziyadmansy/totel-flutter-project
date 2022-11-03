import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';

import 'register_view_model.dart';

class RegisterFormView extends ViewModelWidget<RegisterViewModel> {
  const RegisterFormView({super.key});

  @override
  Widget build(BuildContext context, RegisterViewModel viewModel) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            32,
            getValueForScreenType(context: context, mobile: 16, tablet: 36),
            32,
            getValueForScreenType(context: context, mobile: 16, tablet: 36),
          ),
          child: ReactiveForm(
            formGroup: viewModel.accountForm,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign up',
                    style: AppStyle.of(context).b1B.wCChineseBlack,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We want some basic information about you',
                    style: AppStyle.of(context).b4.wCRhythm,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: AppFormField(
                          label: 'First Name',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.firstName,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.soap,
                              hintText: 'E.g. Wade',
                            ),
                            validationMessages: {
                              ValidationMessage.required: (val) =>
                                  'Enter first name',
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: AppFormField(
                          label: 'Last Name',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.lastName,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.soap,
                              hintText: 'E.g. Warren',
                            ),
                            validationMessages: {
                              ValidationMessage.required: (val) =>
                                  'Enter last name',
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppFormField(
                    label: 'Email Address',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.soap,
                        hintText: 'E.g. willie.jennings@example.com',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (val) => 'Enter your E-mail',
                        ValidationMessage.email: (val) => 'Enter a valid E-mail',
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppFormField(
                    label: 'Enter your phone number',
                    field: ReactivePhoneFormField(
                      formControlName: viewModel.controls.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.soap,
                        hintText: 'E.g. 64888 88245',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (val) => 'Enter phone number',
                        ValidationMessage.minLength: (val) =>
                            'Phone number must be 10 characters',
                        ValidationMessage.maxLength: (val) =>
                            'Phone number must be 10 characters',
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppFormField(
                    label: 'Password',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.password,
                      obscureText: viewModel.obscureText,
                      validationMessages: {
                        ValidationMessage.required: (val) =>
                            'Enter your password',
                        ValidationMessage.minLength: (val) =>
                            'Password must be 6 characters or more',
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.soap,
                        hintText: 'Set your password',
                        suffixIcon: IconButton(
                          onPressed: viewModel.onShowPassword,
                          splashRadius: 1,
                          icon: Icon(viewModel.obscureText
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppFormField(
                    label: 'Confirm Password',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.confirmPassword,
                      obscureText: viewModel.obscureText,
                      validationMessages: {
                        ValidationMessage.required: (val) =>
                            'Confirm password is required',
                        ValidationMessage.minLength: (val) =>
                            'Password must be 6 characters or more',
                        ValidationMessage.mustMatch: (val) =>
                            'Confirmation password doesn\'t match',
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.soap,
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                          onPressed: viewModel.onShowPassword,
                          splashRadius: 1,
                          icon: Icon(viewModel.obscureText
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 52),
                  ElevatedButton(
                    onPressed: viewModel.onRegisterSubmit,
                    child: const Text('Finish'),
                  ),
                  SizedBox(
                    height: getValueForScreenType(
                        context: context, mobile: 16, tablet: 36),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
