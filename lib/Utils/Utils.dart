import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UniversalVariables {
  // American date format starts with the month
  static final dateFormat = DateFormat('MM-dd-yyyy');
  static final bookingApiDateFormat = DateFormat('yyyy-MM-dd');
  static final monthlyDateFormat = DateFormat('MMM, yyyy');
  static final dayMonthDateFormat = DateFormat('dd MMM');
  static final timeFormat = DateFormat.jm(); // 5:08 PM
  static final timeFormat24 = DateFormat.Hm(); // 17:08
  static final dateTimeFormat = DateFormat('MM-dd-yyyy').add_jm();

  static final Color blueColor = Color(0xff2b9ed4);
  static final Color blackColor = Color(0xff19191b);
  static final Color greyColor = Color(0xff8f8f8f);
  static final Color userCircleBackground = Color(0xff2b2b33);
  static final Color onlineDotColor = Color(0xff46dc64);
  static final Color lightBlueColor = Color(0xff0077d7);
  static final Color separatorColor = Color(0xff272c35);

  static final Color gradientColorStart = Color(0xff00b6f3);
  static final Color gradientColorEnd = Color(0xff0184dc);

  static final Color senderColor = Colors.blue;
  static final Color receiverColor = Colors.blue;

  static const double kPostRadius = 8;
  static const double kBorderRadius = 12;
  static const double kButtonBorderRadius = 100;

  static const double kSelectedOpacity = 0.15;
  static const double kUnSelectedOpacity = 0.0;

  static const double kBtnHeight = 60;

  // Status Codes
  static const double kUnauthenticatedCode = 401;

  static final Gradient fabGradient = LinearGradient(
      colors: [gradientColorStart, gradientColorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}

class ReactiveFormControls {
  static const String searchLocation = 'search_location';
  static const String searchRoomsNumber = 'search_rooms_number';
  static const String searchAdultsNumber = 'search_adults_number';

  static const String searchCheckInDate = 'search_check_in_date';
  static const String searchCheckOutDate = 'search_check_out_date';

  static const String searchStartTime = 'search_start_time';
  static const String searchEndTime = 'search_end_time';

  static const String searchHourRangeStart = 'search_hours_range_start';
  static const String searchHourRangeEnd = 'search_hours_range_end';

  // Profile
  static String firstName = 'first_name';
  static String lastName = 'last_name';
  static String native = 'native';
  static String avatar = 'avatar';
  static String occupation = 'occupation';
  static String bio = 'bio';
}

class DebounceTags {
  static const int debouncerDurationInMillis = 1000;
  static const String hotelsDebouncer = 'hotels-selection-debouncer';
}
