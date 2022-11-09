import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/search/presentation/search_provider.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchLocationPage extends StatelessWidget {
  SearchLocationPage({super.key});

  Widget buildRecentSearchCard({required String title, required String body}) {
    return Card(
      elevation: 0,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Center(
                child: Text(
                  body,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return ReactiveForm(
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
                height: 16,
              ),
              Text(
                'Recent Search',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return buildRecentSearchCard(
                      title: 'Osage Beach, ,Missouri',
                      body: '204 Foxrun st. Davison, MI 48423.\nViginia, USA',
                    );
                  },
                ),
              ),
              SizedBox(
                height: 100,
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
              SizedBox(
                height: 8,
              ),
              SharedWidgets.buildRoundedOutlinedButton(
                btnChild: Text('Be a partner'),
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
