import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/widgets/app_drawer.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchLocationPage extends StatelessWidget {
  SearchLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    final mainViewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(
        title: mainViewModel.appBarTitle,
        onNotificationPressed: mainViewModel.onPressedNotifications,
      ),
      drawer: AppDrawer(),
      body: ProviderProgressLoader(
        isLoading: searchProvider.busy(searchProvider.filteredHotels),
        child: ReactiveForm(
          formGroup: searchProvider.searchLocationForm,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Connect with other travelers',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Explore the top destinations in:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ReactiveTextField(
                    formControlName: ReactiveFormControls.searchLocation,
                    decoration: InputDecoration(
                      labelText: 'Where you want to go?',
                      hintText: 'Search anywhere',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onTap: (form) {
                      print(form.value);
                      searchProvider.onSearchHotels();
                    },
                    readOnly: true,
                    validationMessages: {
                      ValidationMessage.required: (val) =>
                          'Enter where you wanna go',
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveDateTimePicker(
                          formControlName:
                              ReactiveFormControls.searchCheckInDate,
                          decoration: const InputDecoration(
                            labelText: 'Check in',
                            suffixIcon: Icon(Icons.calendar_today),
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: ReactiveDateTimePicker(
                          formControlName:
                              ReactiveFormControls.searchCheckOutDate,
                          timePickerEntryMode: TimePickerEntryMode.dial,
                          decoration: const InputDecoration(
                            labelText: 'Check out',
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName:
                              ReactiveFormControls.searchRoomsNumber,
                          decoration: InputDecoration(
                            labelText: 'Rooms',
                            hintText: 'How many rooms',
                          ),
                          keyboardType: TextInputType.number,
                          validationMessages: {
                            ValidationMessage.required: (val) =>
                                'Enter rooms number',
                            ValidationMessage.number: (val) =>
                                'Enter valid number',
                          },
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName:
                              ReactiveFormControls.searchAdultsNumber,
                          decoration: InputDecoration(
                            labelText: 'Adults',
                            hintText: 'How many adults',
                          ),
                          keyboardType: TextInputType.number,
                          validationMessages: {
                            ValidationMessage.required: (val) =>
                                'Enter adults number',
                            ValidationMessage.number: (val) =>
                                'Enter a valid number',
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SharedWidgets.buildRoundedElevatedButton(
                    btnChild: Text('Search'),
                    onPress: () {
                      FocusScope.of(context).unfocus();
                      searchProvider.onSearchLocationSubmit();
                    },
                    btnColor: AppColors.darkGunmetal,
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
