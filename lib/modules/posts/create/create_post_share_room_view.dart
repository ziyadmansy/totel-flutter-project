import 'package:cheffy/Utils/constants.dart';
import 'package:cheffy/Utils/shared_core.dart';
import 'package:cheffy/Utils/theme/theme.dart';
import 'package:cheffy/core/exceptions/location_exception.dart';
import 'package:cheffy/modules/posts/posts/presentation/providers/posts_provider.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/widgets/hotels/searched_hotel_item.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_flutter_rating_bar/reactive_flutter_rating_bar.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'create_post_view_model.dart';
import 'image_item_view.dart';

class CreatePostShareRoomView extends StatefulWidget {
  const CreatePostShareRoomView({super.key});

  @override
  State<CreatePostShareRoomView> createState() =>
      _CreatePostShareRoomViewState();
}

class _CreatePostShareRoomViewState extends State<CreatePostShareRoomView> {
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  void getCategories() {
    Future.delayed(Duration.zero, () async {
      await context.read<PostsProvider>().getCategories();
      final viewModel = context.read<CreatePostViewModel>();
      setState(() {});
      viewModel.notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreatePostViewModel>();
    final postsProvider = context.watch<PostsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room details'),
      ),
      body: BackgroundProgress<CreatePostViewModel>(
        child: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: viewModel.shareRoomForm,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppFormField(
                    label: 'Category',
                    field: ReactiveDropdownField(
                      formControlName: viewModel.controls.category,
                      hint: Text('Category'),
                      validationMessages: {
                        ValidationMessage.required: (val) =>
                            'Enter your category',
                      },
                      items: postsProvider.categories
                          .map(
                            (occ) => DropdownMenuItem<int>(
                              value: occ.id,
                              child: Text(occ.name),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Name of property',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.nameOfProperty,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter the name of property',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Country',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.country,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter the country',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Address',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.address,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter the address',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Room setup',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.roomSetup,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter the room setup',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'What is parking type?',
                    field: ReactiveDropdownField(
                      formControlName: viewModel.controls.parking,
                      hint: Text('Parking availability'),
                      validationMessages: {
                        ValidationMessage.required: (val) =>
                            'Enter parking availability',
                      },
                      items: parkingOptions
                          .map(
                            (park) => DropdownMenuItem<String>(
                              value: park,
                              child: Text(park),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppFormField(
                          label: 'No. of guests',
                          field: ReactiveTextField(
                            formControlName:
                                viewModel.controls.noOfGuestsAllowed,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Enter no. of guests',
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: AppFormField(
                          label: 'No. of bathrooms',
                          field: ReactiveTextField(
                            formControlName: viewModel.controls.noOfBathrooms,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Enter no. of bathrooms',
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Price per group',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.pricePerGroupSize,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      textInputAction: TextInputAction.next,
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter price per group',
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'How much you pay for one night stay',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.chargePerNight,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(prefixText: '\$'),
                      textInputAction: TextInputAction.next,
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter charge per night',
                      },
                    ),
                  ),
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
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Check in',
                    field: Row(
                      children: [
                        Expanded(
                          child: ReactiveDateTimePicker(
                            formControlName: viewModel.controls.checkInTimeFrom,
                            type: ReactiveDatePickerFieldType.time,
                            decoration: const InputDecoration(
                              labelText: 'From',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Enter check In start',
                            },
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: ReactiveDateTimePicker(
                            formControlName: viewModel.controls.checkInTimeTo,
                            type: ReactiveDatePickerFieldType.time,
                            decoration: const InputDecoration(
                              labelText: 'To',
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Enter check In end',
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Message to partner',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.message,
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter your message',
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppFormField(
                    field: ReactiveSwitchListTile.adaptative(
                      formControlName: viewModel.controls.hourlyOrDaily,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Available Hourly?',
                        style: AppStyle.of(context).b4.wCRhythm,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(),
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
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'General',
                    field: Column(
                      children: viewModel.generalFacilities
                          .map((fac) => CheckboxListTile(
                                value: fac.isChecked,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                title: Text(fac.name),
                                onChanged: (value) {
                                  fac.switchCheck(value);
                                  viewModel.notifyListeners();
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Cooking and Cleaning',
                    field: Column(
                      children: viewModel.cookingAndCleaningFacilities
                          .map((fac) => CheckboxListTile(
                                value: fac.isChecked,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                title: Text(fac.name),
                                onChanged: (value) {
                                  fac.switchCheck(value);
                                  viewModel.notifyListeners();
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Entertainment',
                    field: Column(
                      children: viewModel.entertainmentFacilities
                          .map((fac) => CheckboxListTile(
                                value: fac.isChecked,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                title: Text(fac.name),
                                onChanged: (value) {
                                  fac.switchCheck(value);
                                  viewModel.notifyListeners();
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'Outside and View',
                    field: Column(
                      children: viewModel.outsideAndViewFacilities
                          .map((fac) => CheckboxListTile(
                                value: fac.isChecked,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                title: Text(fac.name),
                                onChanged: (value) {
                                  fac.switchCheck(value);
                                  viewModel.notifyListeners();
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    label: 'House rules',
                    field: Column(
                      children: viewModel.houseRulesFacilities
                          .map((fac) => CheckboxListTile(
                                value: fac.isChecked,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                title: Text(fac.name),
                                onChanged: (value) {
                                  fac.switchCheck(value);
                                  viewModel.notifyListeners();
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SharedWidgets.buildRoundedElevatedButton(
                    btnChild: const Text('Post'),
                    onPress: () async {
                      await viewModel.onShareRoomPostSubmit();
                      await postsProvider.getShareRoomPosts();
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
