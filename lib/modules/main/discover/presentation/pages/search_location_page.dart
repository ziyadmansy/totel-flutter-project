import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/widgets/app_drawer.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      body: ReactiveForm(
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
                    fontSize: 44,
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
                  validationMessages: {
                    ValidationMessage.required: (val) =>
                        'Enter where you wanna go',
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                SharedWidgets.buildRoundedElevatedButton(
                  btnChild: Text('Search'),
                  onPress: searchProvider.onNormalSearchLocationSubmit,
                ),
                SizedBox(
                  height: 8,
                ),
                SharedWidgets.buildRoundedElevatedButton(
                  btnChild: Text('Advanced Search'),
                  onPress: searchProvider.onAdvancedSearchLocationSubmit,
                  btnColor: AppColors.darkGunmetal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
