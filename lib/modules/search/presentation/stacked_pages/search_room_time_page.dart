import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/core/enums/day_night_enum.dart';
import 'package:cheffy/modules/search/presentation/search_provider.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchRoomTimePage extends StatelessWidget {
  SearchRoomTimePage({super.key});

  // Initially selected color
  final Color selectedBtnColor = AppColors.plumpPurplePrimary
      .withOpacity(UniversalVariables.kSelectedOpacity);

  // Initially unselected color
  final Color unselectedBtnColor = AppColors.plumpPurplePrimary
      .withOpacity(UniversalVariables.kUnSelectedOpacity);

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      body: ReactiveForm(
        formGroup: searchProvider.timeSearchForm,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReactiveDateTimePicker(
                        formControlName: ReactiveFormControls.searchCheckInDate,
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
                SharedWidgets.buildListTileTitle(
                  title: 'Hours',
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: UniversalVariables.kBtnHeight,
                        child: SharedWidgets.buildRoundedOutlinedButton(
                          isTooRounded: false,
                          btnChild: Text('Day Hours'),
                          onPress: () {
                            searchProvider.onDayNightChoice(DayNight.Day);
                          },
                          btnColor: searchProvider.dayNight == DayNight.Day
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
                          btnChild: Text('Night Hours'),
                          onPress: () {
                            searchProvider.onDayNightChoice(DayNight.Night);
                          },
                          btnColor: searchProvider.dayNight == DayNight.Night
                              ? selectedBtnColor
                              : unselectedBtnColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hourly Basis',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Switch.adaptive(
                      value: searchProvider.isFullDay,
                      onChanged: searchProvider.switchHourlyBasisOrFullDay,
                    ),
                    Expanded(
                      child: Text(
                        'All day',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SharedWidgets.buildListTileTitle(title: 'Hours Range'),
                Row(
                  children: [
                    Expanded(
                      child: ReactiveDateTimePicker(
                        formControlName: ReactiveFormControls.searchStartTime,
                        type: ReactiveDatePickerFieldType.time,
                        decoration: const InputDecoration(
                          labelText: 'Start',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: ReactiveDateTimePicker(
                        formControlName: ReactiveFormControls.searchEndTime,
                        type: ReactiveDatePickerFieldType.time,
                        decoration: const InputDecoration(
                          labelText: 'End',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SharedWidgets.buildListTileTitle(title: 'Price Range'),
                Row(
                  children: [
                    Text('\$ ${searchProvider.minPrice}'),
                    Expanded(
                      child: RangeSlider(
                        values: searchProvider.priceRange,
                        onChanged: searchProvider.onPriceSliderRangeChange,
                        min: searchProvider.minPrice,
                        max: searchProvider.maxPrice,
                        labels: RangeLabels(
                          '\$ ${searchProvider.priceRange.start.toInt()}',
                          '\$ ${searchProvider.priceRange.end.toInt()}',
                        ),
                        divisions:
                            (searchProvider.maxPrice - searchProvider.minPrice)
                                .toInt(),
                      ),
                    ),
                    Text('\$ ${searchProvider.maxPrice}'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SharedWidgets.buildRoundedElevatedButton(
                    btnChild: Text('Search'),
                    onPress: () {},
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
