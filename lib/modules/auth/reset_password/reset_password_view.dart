import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/modules/auth/reset_password/reset_password_view_model.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordView extends ViewModelBuilderWidget<ResetPasswordViewModel> {
  @override
  Widget builder(
      BuildContext context, ResetPasswordViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Text(
          'Reset password',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: ReactiveForm(
        formGroup: viewModel.form,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ReactiveTextField(
              formControlName: viewModel.newPasswordFormControl,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.soap,
                hintText: 'Enter your new password',
                labelText: 'New Password',
              ),
              validationMessages: {
                ValidationMessage.required: (val) => 'Enter new password',
                ValidationMessage.minLength: (val) =>
                    'Password must be 6 characters or more',
              },
            ),
            SizedBox(
              height: 16,
            ),
            ReactiveTextField(
              formControlName: viewModel.confirmPasswordFormControl,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.soap,
                hintText: 'Enter confirm password',
                labelText: 'Confirm Password',
              ),
              validationMessages: {
                ValidationMessage.required: (val) => 'Enter confirm password',
                ValidationMessage.minLength: (val) =>
                    'Password must be 6 characters or more',
                ValidationMessage.mustMatch: (err) => 'Passwords must match',
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: viewModel.onResetClicked,
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ResetPasswordViewModel viewModelBuilder(BuildContext context) =>
      ResetPasswordViewModel();
}
