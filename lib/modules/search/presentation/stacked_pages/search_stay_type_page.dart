import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/core/enums/day_week_enum.dart';
import 'package:cheffy/modules/search/presentation/search_provider.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchStayTypePage extends StatelessWidget {
  SearchStayTypePage({super.key});

  // Initially selected color
  final Color selectedBtnColor = AppColors.plumpPurplePrimary
      .withOpacity(UniversalVariables.kSelectedOpacity);

  // Initially unselected color
  final Color unselectedBtnColor = AppColors.plumpPurplePrimary
      .withOpacity(UniversalVariables.kUnSelectedOpacity);

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return SingleChildScrollView(
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
                SharedWidgets.buildListTileTitle(title: 'Select Days'),
                ReactiveTextField(
                  formControlName: ReactiveFormControls.searchDaysNumber,
                  decoration: InputDecoration(
                    labelText: 'Days',
                    hintText: 'How many days',
                  ),
                  keyboardType: TextInputType.number,
                  validationMessages: {
                    ValidationMessage.required: (val) => 'Enter days number',
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                SharedWidgets.buildListTileTitle(title: 'Room Service Type'),
                SharedWidgets.buildSwitchListTile(
                  val: searchProvider.isFullBoard,
                  title: 'Full Board',
                  onChange: searchProvider.switchFullBoard,
                ),
                SharedWidgets.buildSwitchListTile(
                  val: searchProvider.isHalfBoard,
                  title: 'Half Board',
                  onChange: searchProvider.switchHalfBoard,
                ),
                SharedWidgets.buildSwitchListTile(
                  val: searchProvider.isBedAndBreakfast,
                  title: 'Bed & Breakfast',
                  onChange: searchProvider.switchBedAndBreakfast,
                ),
                SharedWidgets.buildSwitchListTile(
                  val: searchProvider.isRoomOnly,
                  title: 'Room Only',
                  onChange: searchProvider.switchRoomOnly,
                ),
                SizedBox(
                  height: 16,
                ),
                SharedWidgets.buildListTileTitle(title: 'Rooms count'),
                ReactiveTextField(
                  formControlName: ReactiveFormControls.searchRoomsNumber,
                  decoration: InputDecoration(
                    labelText: 'Rooms',
                    hintText: 'How many rooms',
                  ),
                  keyboardType: TextInputType.number,
                  validationMessages: {
                    ValidationMessage.required: (val) => 'Enter rooms number',
                    ValidationMessage.number: (val) => 'Enter a valid number',
                    ValidationMessage.max: (val) =>
                        'Max rooms number is ${searchProvider.maxRoomsNumber}',
                  },
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
    );
  }
}
