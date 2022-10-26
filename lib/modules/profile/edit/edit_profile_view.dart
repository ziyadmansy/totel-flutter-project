import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';
import 'package:cheffy/modules/widgets/app_toggle_button.dart';

import 'edit_profile_view_model.dart';

class EditProfileView extends ViewModelBuilderWidget<EditProfileViewModel> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  EditProfileView({super.key});

  @override
  Widget builder(
      BuildContext context, EditProfileViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          AppBarActionButton(
            onPressed: viewModel.settings,
            showElevation: false,
            child: Image(
              image: R.svg.ic_settings(width: 24, height: 24),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ReactiveForm(
          formGroup: viewModel.form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFormField(
                          label: 'Full Name',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.fullName,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppFormField(
                          label: 'Email',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.email,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppFormField(
                          label: 'Phone Number',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.phoneNumber,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppFormField(
                          label: 'Occupation',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.occupation,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppFormField(
                          label: 'BIO',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.bio,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppFormField(
                          label: 'Date of Birth',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.dob,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppFormField(
                          label: 'City',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.city,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AppFormField(
                          label: 'Who are you',
                          field: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppToggleButton(
                                icon: R.svg.ic_male(width: 21, height: 28),
                                name: 'Male',
                                isSelected: viewModel.isMalePartner,
                                callback: () => viewModel
                                    .onTapMalePartner(viewModel.isMalePartner),
                              ),
                              const SizedBox(width: 16),
                              AppToggleButton(
                                icon: R.svg.ic_female(width: 21, height: 28),
                                name: 'Female',
                                isSelected: viewModel.isFemalePartner,
                                callback: () => viewModel.onTapFemalePartner(
                                    viewModel.isFemalePartner),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0, -2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: viewModel.onSave,
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  EditProfileViewModel viewModelBuilder(BuildContext context) =>
      EditProfileViewModel();
}
