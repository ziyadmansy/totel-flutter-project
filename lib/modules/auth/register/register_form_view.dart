import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
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
            formGroup: viewModel.accountForm,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Your Details',
                    style: AppStyle.of(context).b1B.wCChineseBlack,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We want some basic information',
                    style: AppStyle.of(context).b4.wCRhythm,
                  ),
                  const SizedBox(height: 64),
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
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppFormField(
                    label: 'Username',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.username,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.soap,
                        hintText: 'username',
                      ),
                    ),
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
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppFormField(
                    label: 'Password',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.password,
                      obscureText: viewModel.obscureText,
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
