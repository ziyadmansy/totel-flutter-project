import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/core/enums/day_week_enum.dart';
import 'package:cheffy/modules/search/presentation/search_provider.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchStayingScreen extends StatelessWidget {
  SearchStayingScreen({super.key});

  // Initially selected color
  final Color selectedBtnColor = AppColors.plumpPurplePrimary
      .withOpacity(UniversalVariables.kSelectedOpacity);

  // Initially unselected color
  final Color unselectedBtnColor = AppColors.plumpPurplePrimary
      .withOpacity(UniversalVariables.kUnSelectedOpacity);

  Widget buildSwitchListTile({
    required String title,
    required bool val,
    required void Function(bool)? onChange,
  }) {
    return SwitchListTile.adaptive(
      value: val,
      title: Text(title),
      onChanged: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: SharedWidgets.buildAppBar(title: 'Going to Stay'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: ReactiveForm(
              formGroup: searchProvider.stayingSearchForm,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: UniversalVariables.kBtnHeight,
                          child: SharedWidgets.buildRoundedOutlinedButton(
                            isTooRounded: false,
                            btnChild: Text('Day'),
                            onPress: () {
                              searchProvider.onDayweekChoice(DayWeek.Day);
                            },
                            btnColor: searchProvider.dayWeek == DayWeek.Day
                                ? selectedBtnColor
                                : unselectedBtnColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: UniversalVariables.kBtnHeight,
                          child: SharedWidgets.buildRoundedOutlinedButton(
                            isTooRounded: false,
                            btnChild: Text('Week'),
                            onPress: () {
                              searchProvider.onDayweekChoice(DayWeek.Week);
                            },
                            btnColor: searchProvider.dayWeek == DayWeek.Week
                                ? selectedBtnColor
                                : unselectedBtnColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ReactiveDropdownField(
                    formControlName: ReactiveFormControls.selectedDays,
                    hint: Text('Select Days'),
                    validationMessages: {
                      ValidationMessage.required: (val) => 'Select Stay Days',
                    },
                    items: [
                      DropdownMenuItem<int>(
                        value: 10,
                        child: Text('10%'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      'Room Service Type',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  buildSwitchListTile(
                    val: searchProvider.isFullBoard,
                    title: 'Full Board',
                    onChange: searchProvider.switchFullBoard,
                  ),
                  buildSwitchListTile(
                    val: searchProvider.isHalfBoard,
                    title: 'Half Board',
                    onChange: searchProvider.switchHalfBoard,
                  ),
                  buildSwitchListTile(
                    val: searchProvider.isBedAndBreakfast,
                    title: 'Bed & Breakfast',
                    onChange: searchProvider.switchBedAndBreakfast,
                  ),
                  buildSwitchListTile(
                    val: searchProvider.isRoomOnly,
                    title: 'Room Only',
                    onChange: searchProvider.switchRoomOnly,
                  ),
                  Divider(),
                  SizedBox(
                    height: 16,
                  ),
                  ReactiveDropdownField(
                    formControlName: ReactiveFormControls.roomsCount,
                    hint: Text('Select Rooms'),
                    validationMessages: {
                      ValidationMessage.required: (val) => 'Select Rooms',
                    },
                    items: [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('1'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('2'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('3'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SharedWidgets.buildRoundedElevatedButton(
                      btnChild: Text('Continue'),
                      onPress: searchProvider.onSubmitBtnPressed,
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
