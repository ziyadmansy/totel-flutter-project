import 'package:cheffy/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_flutter_rating_bar/reactive_flutter_rating_bar.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/core/enums/post_type.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';
import 'package:cheffy/ui/widgets/app_form_field.dart';
import 'package:cheffy/ui/widgets/app_toggle_button.dart';
import 'package:cheffy/ui/widgets/progress/background_progress.dart';

import 'create_post_view_model.dart';
import 'image_item_view.dart';

class CreatePostView extends ViewModelBuilderWidget<CreatePostViewModel> {
  final PostType type;

  const CreatePostView({super.key, required this.type});

  @override
  Widget builder(
      BuildContext context, CreatePostViewModel viewModel, Widget? child) {

    return Scaffold(
      appBar: AppBar(title: const Text('Add Travel Details')),
      body: BackgroundProgress<CreatePostViewModel>(
        child: SafeArea(
          child: SingleChildScrollView(
            child: ReactiveForm(
              formGroup: viewModel.form,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //region image
                    if (viewModel.type == PostType.booked) ...[
                      ReactiveFormField(
                        formControlName: viewModel.controls.attachments,
                        builder: (state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return ImageItemView(
                                      image: viewModel.attachments[index],
                                      onPressedAdd: () =>
                                          viewModel.onPressedAdd(),
                                      onPressedRemove: () =>
                                          viewModel.onPressedRemove(index),
                                    );
                                  },
                                  itemCount: viewModel.attachments.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              if (state.errorText.isNotNullOrEmpty) ...[
                                const SizedBox(height: 8),
                                Text(
                                  '${state.errorText}',
                                  style: AppStyle.of(context).b5.wCError,
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                    //endregion
                    //region location
                    AppFormField(
                      label: viewModel.type == PostType.booked
                          ? 'Where you are going'
                          : 'Where you want to go',
                      field: ReactiveTextField(
                        formControlName: viewModel.controls.location,
                        onTap: viewModel.onLocation,
                        readOnly: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    //endregion
                    //region date
                    AppFormField(
                      label: viewModel.type == PostType.booked
                          ? 'When you going'
                          : 'When you want to go',
                      field: Theme(
                        data: Theme.of(context).copyWith(useMaterial3: false),
                        child: ReactiveDateRangePicker(
                          formControlName: viewModel.controls.date,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    //endregion
                    //region name
                    if (viewModel.type == PostType.booked) ...[
                      AppFormField(
                        label: 'Enter Hotel Name',
                        field: ReactiveTextField(
                          formControlName: viewModel.controls.hotel,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                    //endregion
                    //region rate
                    if (viewModel.type == PostType.booked) ...[
                      AppFormField(
                        label: 'Rate Hotel',
                        field: ReactiveRatingBar<double>(
                          formControlName: viewModel.controls.rating,
                          allowHalfRating: true,
                          decoration: const InputDecoration(
                            filled: false,
                            isDense: true,
                            isCollapsed: true,
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star_rounded,
                              color: AppColors.plumpPurplePrimary,
                            ),
                            half: Icon(
                              Icons.star_half_rounded,
                              color: AppColors.plumpPurplePrimary,
                            ),
                            empty: Icon(
                              Icons.star_border_rounded,
                              color: AppColors.plumpPurplePrimary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                    //endregion
                    //region price
                    AppFormField(
                      label: viewModel.type == PostType.booked
                          ? 'How much you pay for one night stay'
                          : 'Your budget for hotel (optional)',
                      field: ReactiveTextField(
                        formControlName: viewModel.controls.price,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(prefixText: '\$'),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    if (viewModel.type == PostType.booked) ...[
                      const SizedBox(height: 4),
                      ReactiveFormConsumer(
                        builder: (context, form, child) => Text.rich(
                          TextSpan(children: [
                            const TextSpan(text: 'Your Partner Pay '),
                            TextSpan(
                              text: viewModel.partnerAmount.currency,
                              style:
                                  AppStyle.of(context).b5.wCPlumpPurplePrimary,
                            ),
                            const TextSpan(text: ' to you'),
                          ]),
                          style: AppStyle.of(context).b5.wCRhythm,
                        ),
                      ),
                    ],
                    //endregion
                    const SizedBox(height: 24),
                    //region message
                    AppFormField(
                      label: 'Message for your partner',
                      field: ReactiveTextField(
                        formControlName: viewModel.controls.message,
                      ),
                    ),
                    //endregion
                    const SizedBox(height: 24),
                    //region partner
                    AppFormField(
                      label: 'Type of travel partner looking for',
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
                            callback: () => viewModel
                                .onTapFemalePartner(viewModel.isFemalePartner),
                          ),
                        ],
                      ),
                    ),
                    //endregion
                    const SizedBox(height: 24),
                    if (viewModel.type == PostType.finding) ...[
                      AppFormField(
                        field: ReactiveSwitchListTile(
                          formControlName: viewModel.controls.hourly,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Available to Hourly?',
                            style: AppStyle.of(context).b4.wCRhythm,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                    ElevatedButton(
                      onPressed: viewModel.onSubmit,
                      child: const Text('Post it'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  CreatePostViewModel viewModelBuilder(BuildContext context) =>
      CreatePostViewModel(type, locator.get());
}
