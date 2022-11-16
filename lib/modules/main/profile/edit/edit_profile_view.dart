import 'package:cheffy/Models/occupation.dart';
import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/core/enums/male_female_enum.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';
import 'package:cheffy/modules/widgets/app_toggle_button.dart';

class EditProfileView extends StatefulWidget {
  EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  void initState() {
    super.initState();
    final profileProvider = context.read<ProfileProvider>();
    Future.delayed(Duration.zero, () {
      profileProvider.getOccupations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: BackgroundProgress<ProfileProvider>(
        child: SafeArea(
          child: ReactiveForm(
            formGroup: profileProvider.editProfileForm,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    AppFormField(
                      label: 'Avatar',
                      field: ReactiveImagePicker(
                        formControlName: ReactiveFormControls.avatar,
                        inputBuilder: (onPressed) => TextButton.icon(
                          onPressed: onPressed,
                          icon: const Icon(Icons.add),
                          label: const Text('Add an avatar'),
                        ),
                        imageQuality: 40,
                        validationMessages: {
                          ValidationMessage.required: (val) =>
                              'Select your avatar',
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppFormField(
                            label: 'First Name',
                            field: ReactiveTextField(
                              formControlName: ReactiveFormControls.firstName,
                              decoration: InputDecoration(
                                hintText: 'ex: John',
                              ),
                              validationMessages: {
                                ValidationMessage.required: (val) =>
                                    'Enter first name',
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: AppFormField(
                            label: 'Last Name',
                            field: ReactiveTextField(
                              formControlName: ReactiveFormControls.lastName,
                              decoration: InputDecoration(
                                hintText: 'ex: Doe',
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
                      label: 'Native',
                      field: ReactiveTextField(
                        formControlName: ReactiveFormControls.native,
                        decoration: InputDecoration(
                          hintText: 'ex: us',
                        ),
                        validationMessages: {
                          ValidationMessage.required: (val) =>
                              'Enter your native',
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppFormField(
                      label: 'Occupation',
                      field: ReactiveDropdownField(
                        formControlName: ReactiveFormControls.occupation,
                        hint: Text('Occupation'),
                        validationMessages: {
                          ValidationMessage.required: (val) =>
                              'Enter your occupation',
                        },
                        items: profileProvider.occupations
                            .map(
                              (occ) => DropdownMenuItem<int>(
                                value: occ.id,
                                child: Text(occ.name),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppFormField(
                      label: 'Bio',
                      field: ReactiveTextField(
                        formControlName: ReactiveFormControls.bio,
                        decoration: InputDecoration(
                          hintText:
                              'ex: I\'m a student looking for rental rooms',
                        ),
                        maxLines: 5,
                        validationMessages: {
                          ValidationMessage.required: (val) => 'Enter your bio',
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    SharedWidgets.buildListTileTitle(title: 'Who are you'),
                    RadioListTile<MaleFemaleEnum>(
                      value: MaleFemaleEnum.male,
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Male'),
                      groupValue: profileProvider.maleFemaleEnum,
                      onChanged: profileProvider.onMaleFemaleChoice,
                    ),
                    RadioListTile<MaleFemaleEnum>(
                      value: MaleFemaleEnum.female,
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Female'),
                      groupValue: profileProvider.maleFemaleEnum,
                      onChanged: profileProvider.onMaleFemaleChoice,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SharedWidgets.buildRoundedElevatedButton(
                        btnChild: Text('Save'),
                        onPress: () async {
                          FocusScope.of(context).unfocus();
                          await profileProvider.onEditSave();
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
