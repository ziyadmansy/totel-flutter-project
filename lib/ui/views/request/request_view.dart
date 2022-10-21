import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';
import 'package:cheffy/ui/widgets/app_form_field.dart';
import 'package:cheffy/ui/widgets/app_toggle_button.dart';

import 'request_view_model.dart';

class RequestView extends ViewModelBuilderWidget<RequestViewModel> {
  const RequestView({super.key});

  @override
  Widget builder(
      BuildContext context, RequestViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Requirement')),
      body: ReactiveForm(
        formGroup: viewModel.form,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppToggleButton(
                            icon: R.svg.ic_calendar_2(width: 24, height: 24),
                            name: 'For Days',
                            isSelected: viewModel.isForDays,
                            callback: viewModel.onTapRequirementType,
                          ),
                          const SizedBox(width: 16),
                          AppToggleButton(
                            icon: R.svg.ic_clock(width: 24, height: 24),
                            name: 'For Hours',
                            isSelected: !viewModel.isForDays,
                            callback: viewModel.onTapRequirementType,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppFormField(
                        label: 'Select Date',
                        field: ReactiveTextField(
                          formControlName: viewModel.controls.date,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppFormField(
                        label: 'Select Hours',
                        field: ReactiveTextField(
                          formControlName: viewModel.controls.hours,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppFormField(
                        label: 'Upload Documents',
                        field: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(13),
                          color: AppColors.plumpPurplePrimary,
                          dashPattern: const [5, 5],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 16,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image(
                                  width: 54,
                                  height: 54,
                                  image: R.svg.ic_image_upload(
                                    width: 54,
                                    height: 54,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Upload your ID proof\nLike Driver\'s License, Passport',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.of(context).b6.wCCrayola,
                                ),
                                TextButton(
                                  onPressed: viewModel.onBrowse,
                                  child: const Text('Browse'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: viewModel.onSubmit,
                  child: const Text('Send Request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  RequestViewModel viewModelBuilder(BuildContext context) => RequestViewModel();
}
