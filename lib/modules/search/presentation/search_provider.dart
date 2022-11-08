import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/core/enums/day_week_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchProvider extends ChangeNotifier {
  final NavigationService _navigationService = locator.get();
  final BottomSheetService _bottomSheetService = locator.get();

  late final FormGroup stayingSearchForm;

  // Selected (Day / Week) Choice
  DayWeek dayWeek = DayWeek.Day;

  bool isFullBoard = false;
  bool isHalfBoard = false;
  bool isBedAndBreakfast = false;
  bool isRoomOnly = false;

  SearchProvider() {
    stayingSearchForm = FormGroup({
      ReactiveFormControls.selectedDays: FormControl<int>(
        validators: [
          Validators.required,
        ],
      ),
      ReactiveFormControls.roomsCount: FormControl<int>(
        validators: [
          Validators.required,
        ],
      ),
    });
  }

  void onSubmitBtnPressed() {
    if (stayingSearchForm.valid) {
      // Continue the process of searching
      _navigationService.navigateTo(Routes.searchHoursView);
    } else {
      stayingSearchForm.markAllAsTouched();
    }
  }

  void onDayweekChoice(DayWeek dayWeekChoice) {
    dayWeek = dayWeekChoice;
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
