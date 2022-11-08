import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/stacked_nav_keys.dart';
import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/enums/day_night_enum.dart';
import 'package:cheffy/core/enums/day_week_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchProvider extends ChangeNotifier {
  bool isLoading = false;

  final NavigationService _navigationService = locator.get();
  final BottomSheetService _bottomSheetService = locator.get();

  // Search location Page Form
  late final FormGroup searchLocationForm;

  // Search Room Type Page Form
  late final FormGroup stayingSearchForm;

  // Search Time Page Form
  late final FormGroup timeSearchForm;

  // Whether the switch button is
  // Hourly Basis: false
  // Full day: true
  bool isFullDay = false;

  // Selected (Day / Week) Choice
  DayWeek dayWeek = DayWeek.Day;

  // Selected (Day / Week) Choice
  DayNight dayNight = DayNight.Day;

  // Room suit types
  bool isFullBoard = false;
  bool isHalfBoard = false;
  bool isBedAndBreakfast = false;
  bool isRoomOnly = false;

  int maxRoomsNumber = 5;

  double minPrice = 0.0;
  double maxPrice = 1000.0;
  late RangeValues priceRange;

  SearchProvider() {
    // Initializes price range slider
    priceRange = RangeValues(minPrice, maxPrice);

    searchLocationForm = FormGroup({
      ReactiveFormControls.searchLocation: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    });

    stayingSearchForm = FormGroup(
      {
        ReactiveFormControls.searchDaysNumber: FormControl<int>(
          validators: [
            Validators.required,
          ],
        ),
        ReactiveFormControls.searchRoomsNumber: FormControl<int>(
          validators: [
            Validators.required,
            Validators.number,
            Validators.max<int>(maxRoomsNumber),
          ],
        ),
      },
    );

    timeSearchForm = FormGroup({
      ReactiveFormControls.searchHourRangeStart: FormControl<int>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.searchHourRangeEnd: FormControl<int>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.searchCheckInDate: FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.searchCheckOutDate: FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.searchStartTime: FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.searchEndTime: FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
    });
  }

  void switchHourlyBasisOrFullDay(bool? isOn) {
    if (isOn != null) {
      isFullDay = isOn;
      notifyListeners();
    }
  }

  void onPriceSliderRangeChange(RangeValues values) {
    priceRange = values;
    notifyListeners();
  }

  void onLocationSubmit() {
    if (searchLocationForm.valid) {
      // Continue the process of searching to stay type
      _navigationService.navigateTo(
        SearchRoutes.stayTypeView,
        id: StackedNavKeys.searchNavKey,
      );
    } else {
      print('Not valid (onLocationSubmit)');
      searchLocationForm.markAllAsTouched();
    }
  }

  void onSubmitBtnPressed() {
    if (stayingSearchForm.valid) {
      // Continue the process of searching to room type
      _navigationService.navigateTo(
        SearchRoutes.roomTypeView,
        id: StackedNavKeys.searchNavKey,
      );
    } else {
      print('Not valid (onLocationSubmit)');
      stayingSearchForm.markAllAsTouched();
    }
  }

  void onDayweekChoice(DayWeek dayWeekChoice) {
    dayWeek = dayWeekChoice;
    notifyListeners();
  }

  void onDayNightChoice(DayNight dayNightChoice) {
    dayNight = dayNightChoice;
    notifyListeners();
  }

  void switchFullBoard(bool? isActive) {
    if (isActive != null) {
      isFullBoard = isActive;
    }
    notifyListeners();
  }

  void switchHalfBoard(bool? isActive) {
    if (isActive != null) {
      isHalfBoard = isActive;
    }
    notifyListeners();
  }

  void switchBedAndBreakfast(bool? isActive) {
    if (isActive != null) {
      isBedAndBreakfast = isActive;
    }
    notifyListeners();
  }

  void switchRoomOnly(bool? isActive) {
    if (isActive != null) {
      isRoomOnly = isActive;
    }
    notifyListeners();
  }
}
