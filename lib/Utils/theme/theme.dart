import 'package:cheffy/Utils/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color.dart';

class AppTheme {
  final BuildContext context;

  AppTheme._internal(this.context);

  static AppTheme of(BuildContext context) {
    return AppTheme._internal(context);
  }

  ThemeData get light => ThemeData(
        // useMaterial3: true,
        colorScheme: AppColors.lightColorScheme,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ).copyWith(
        inputDecorationTheme: inputDecorationThemeDefault,
        elevatedButtonTheme: elevatedButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: AppColors.plumpPurplePrimary,
            textStyle: AppStyle.of(context).b4,
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          // scrolledUnderElevation: 0,
          titleSpacing: 0,
          titleTextStyle: AppStyle.of(context).b3M.wCChineseBlack,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
      );

  ThemeData get dark => ThemeData(
        // useMaterial3: true,
        colorScheme: AppColors.darkColorScheme,
      ).copyWith(
          // inputDecorationTheme: AppTheme.inputDecorationThemeDefault,
          // elevatedButtonTheme: elevatedButtonThemeData,
          // textButtonTheme: textButtonThemeData,
          // outlinedButtonTheme: outlinedButtonThemeData,
          // appBarTheme: const AppBarTheme(elevation: 0),
          );

  static InputDecorationTheme get inputDecorationThemeDefault =>
      InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.soap),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.soap),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.plumpPurplePrimary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightColorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: AppColors.lightColorScheme.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightColorScheme.surface),
        ),
      );

//
// static InputDecorationTheme get inputDecorationTheme2 => InputDecorationTheme(
//       filled: true,
//       isDense: true,
//       fillColor: Colors.white,
//       labelStyle: TextStyle(
//         color: AppColors.textFieldLabel,
//       ),
//       hintStyle: TextStyle(
//         color: AppColors.textFieldHint,
//         fontSize: 13.0,
//         fontWeight: FontWeight.w600,
//       ),
//       errorStyle: TextStyle(
//         color: AppColors.textFieldError,
//         fontSize: 13.0,
//         fontWeight: FontWeight.w600,
//       ),
//       focusColor: AppColors.textFieldFocused,
//       border: OutlineInputBorder(
//         borderSide: BorderSide(color: AppColors.textFieldNormal),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: AppColors.textFieldNormal),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: AppColors.textFieldFocused),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: AppColors.textFieldError),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: AppColors.textFieldError, width: 2.0),
//       ),
//       disabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: AppColors.textFieldDisabled),
//       ),
//     );

  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: AppColors.plumpPurplePrimary,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
  static final OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      primary: AppColors.plumpPurplePrimary,
      side: BorderSide(color: AppColors.plumpPurplePrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

// static final OutlinedButtonThemeData outlinedButtonThemeData =
//     OutlinedButtonThemeData(
//   style: OutlinedButton.styleFrom(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//   ),
// );
}
