import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UniversalVariables {
  static final dateFormat = DateFormat('yyyy-MM-dd');
  static final monthlyDateFormat = DateFormat('MMM, yyyy');
  static final timeFormat = DateFormat.jm();
  static final dateTimeFormat = DateFormat('dd-MM-yyyy').add_jm();

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

  static const double kBorderRadius = 12;
  static const double kButtonBorderRadius = 100;

  static const double kSelectedOpacity = 0.15;
  static const double kUnSelectedOpacity = 0.0;

  static const double kBtnHeight = 60;

  static final Gradient fabGradient = LinearGradient(
      colors: [gradientColorStart, gradientColorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}

class ReactiveFormControls {
  static const String selectedDays = 'selected_days';
  static const String roomsCount = 'rooms_count';
}
