import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordViewModel extends BaseViewModel {
  String newPasswordFormControl = 'newPassword';
  String confirmPasswordFormControl = 'confirmPassword';

  late FormGroup form;

  ResetPasswordViewModel() {
    form = FormGroup(
      {
        newPasswordFormControl: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
        confirmPasswordFormControl: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
      },
      validators: [
        Validators.mustMatch(
            newPasswordFormControl, confirmPasswordFormControl),
      ],
    );
  }

  Future<void> onResetClicked() async {
    if (form.valid) {
    } else {
      form.markAllAsTouched();
    }
  }
}
