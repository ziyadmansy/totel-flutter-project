import 'package:cheffy/modules/posts/create/create_post_view_model.dart';
import 'package:cheffy/modules/posts/posts/presentation/providers/posts_provider.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/app_form_field.dart';
import 'package:cheffy/modules/widgets/booking_item.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';

class CreatePostFindingPartnerView extends StatelessWidget {
  const CreatePostFindingPartnerView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreatePostViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finding partner details'),
      ),
      body: BackgroundProgress<CreatePostViewModel>(
        child: ReactiveForm(
          formGroup: viewModel.findingPartnerForm,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AppFormField(
                    label: 'Message to partner',
                    field: ReactiveTextField(
                      formControlName: viewModel.controls.messageToPartner,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'What do you have to share?',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Enter your message',
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  ReactiveFormField(
                    formControlName: viewModel.controls.partnerGender,
                    builder: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SharedWidgets.buildListTileTitle(
                              title: 'Partner Gender'),
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
                  const SizedBox(height: 16),
                  ReactiveFormField(
                    formControlName: viewModel.controls.selectedBooking,
                    builder: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SharedWidgets.buildListTileTitle(title: 'Booking'),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.soap),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: viewModel.selectedBookingHotel == null
                                ? const Center(
                                    child: Text(
                                      'No booking selected yet',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                : BookingItem(
                                    bookingEntity:
                                        viewModel.selectedBookingHotel!,
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SharedWidgets.buildIconTextButton(
                              btnText: 'Select Booking',
                              btnIcon: FontAwesomeIcons.hotel,
                              onPress: viewModel.onAddBookingPress,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SharedWidgets.buildRoundedElevatedButton(
                      btnChild: const Text('Post'),
                      onPress: () async {
                        await viewModel.onFindingPartnerPostSubmit();
                        await context
                            .read<PostsProvider>()
                            .getFindingPartnerPosts();
                      },
                    ),
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
