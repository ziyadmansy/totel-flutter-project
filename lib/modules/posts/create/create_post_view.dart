import 'package:cheffy/Utils/theme/theme.dart';
import 'package:cheffy/widgets/hotels/searched_hotel_item.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_flutter_rating_bar/reactive_flutter_rating_bar.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:cheffy/core/enums/post_type.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'create_post_view_model.dart';
import 'image_item_view.dart';

class CreatePostView extends StatelessWidget {
  final PostType type;

  const CreatePostView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreatePostViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Travel Details'),
      ),
      body: BackgroundProgress<CreatePostViewModel>(
        child: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: viewModel.form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReactiveFormField(
                    formControlName: viewModel.controls.attachments,
                    builder: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SharedWidgets.buildListTileTitle(
                              title: 'Attachments'),
                          viewModel.attachments.isEmpty
                              ? SizedBox(
                                  height: 100,
                                  child: InkWell(
                                    onTap: viewModel.onPressedAdd,
                                    borderRadius: BorderRadius.circular(9),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: AppColors.soap),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                )
                              : SizedBox(
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
                          const SizedBox(height: 8),
                          SharedWidgets.buildIconTextButton(
                            btnText: 'Add Attachments',
                            btnIcon: Icons.add,
                            onPress: viewModel.onPressedAdd,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  //endregion
                  //region hotel
                  SharedWidgets.buildListTileTitle(title: 'Hotel'),
                  viewModel.selectedHotel == null
                      ? SizedBox(
                          height: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.soap),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: const Center(
                              child: Text(
                                'No hotel selected yet',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SearchedHotelItem(
                          hotel: viewModel.selectedHotel!,
                        ),
                  const SizedBox(height: 8),
                  SharedWidgets.buildIconTextButton(
                    btnText: 'Select Hotel',
                    btnIcon: FontAwesomeIcons.hotel,
                    onPress: viewModel.onAddHotelPress,
                  ),
                  const SizedBox(height: 24),
                  //endregion
                  //region date
                  Theme(
                    // (SAVE) button disappears with (useMaterial3)
                    data: AppTheme.of(context).light.copyWith(
                          useMaterial3: false,
                        ),
                    child: AppFormField(
                      label: type == PostType.booked
                          ? 'When are you going'
                          : 'When do you wanna go',
                      field: ReactiveDateRangePicker(
                        formControlName: viewModel.controls.date,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  //endregion
                  //region rate
                  // if (type == PostType.booked) ...[
                  //   AppFormField(
                  //     label: 'Hotel Rating',
                  //     field: ReactiveRatingBar<double>(
                  //       formControlName: viewModel.controls.rating,
                  //       allowHalfRating: true,
                  //       decoration: const InputDecoration(
                  //         filled: false,
                  //         isDense: true,
                  //         isCollapsed: true,
                  //         border: InputBorder.none,
                  //         errorBorder: InputBorder.none,
                  //         focusedBorder: InputBorder.none,
                  //         focusedErrorBorder: InputBorder.none,
                  //         disabledBorder: InputBorder.none,
                  //         enabledBorder: InputBorder.none,
                  //         contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //       ),
                  //       ratingWidget: RatingWidget(
                  //         full: Icon(
                  //           Icons.star_rounded,
                  //           color: AppColors.plumpPurplePrimary,
                  //         ),
                  //         half: Icon(
                  //           Icons.star_half_rounded,
                  //           color: AppColors.plumpPurplePrimary,
                  //         ),
                  //         empty: Icon(
                  //           Icons.star_border_rounded,
                  //           color: AppColors.plumpPurplePrimary,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   const SizedBox(height: 24),
                  // ],
                  //endregion
                  //region price
                  AppFormField(
                    label: type == PostType.booked
                        ? 'How much you pay for one night stay'
                        : 'Your budget for hotel (optional)',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.price,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(prefixText: '\$'),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ReactiveFormConsumer(
                    builder: (context, form, child) => Text.rich(
                      TextSpan(children: [
                        const TextSpan(text: 'Your partner pays '),
                        TextSpan(
                          text: viewModel.partnerAmount.currency,
                          style: AppStyle.of(context).b5.wCPlumpPurplePrimary,
                        ),
                        const TextSpan(text: ' to you'),
                      ]),
                      style: AppStyle.of(context).b5.wCRhythm,
                    ),
                  ),
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
                    label: 'Gender of travel partner looking for',
                    field: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CheckboxListTile(
                          value: viewModel.isMalePartner,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          title: Text('Male'),
                          onChanged: viewModel.onTapMalePartner,
                        ),
                        CheckboxListTile(
                          value: viewModel.isFemalePartner,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          title: Text('Female'),
                          onChanged: viewModel.onTapFemalePartner,
                        ),
                      ],
                    ),
                  ),
                  //endregion
                  const SizedBox(height: 24),
                  AppFormField(
                    field: ReactiveSwitchListTile.adaptative(
                      formControlName: viewModel.controls.hourly,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Available Hourly?',
                        style: AppStyle.of(context).b4.wCRhythm,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SharedWidgets.buildRoundedElevatedButton(
                    btnChild: const Text('Post'),
                    onPress: () async {
                      await viewModel.onSubmit(type);
                    },
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
