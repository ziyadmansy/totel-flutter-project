import 'package:flutter/material.dart';
import 'package:cheffy/ui/theme/color.dart';

class AppStyle {
  final BuildContext context;

  AppStyle._internal(this.context);

  static AppStyle of(BuildContext context) {
    return AppStyle._internal(context);
  }

  //region b6
  TextStyle? get b6 => Theme.of(context).textTheme.bodySmall;

  TextStyle? get b6M => b6?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get b6B => b6?.copyWith(fontWeight: FontWeight.w700);

  //endregion

  //region b5
  TextStyle? get b5 => Theme.of(context).textTheme.bodyMedium;

  TextStyle? get b5M => b5?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get b5B => b5?.copyWith(fontWeight: FontWeight.w700);

  //endregion

  //region b4
  TextStyle? get b4 => Theme.of(context).textTheme.titleMedium;

  TextStyle? get b4M => b4?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get b4B => b4?.copyWith(fontWeight: FontWeight.w700);

  //endregion

  //region b3
  TextStyle? get b3 => Theme.of(context).textTheme.titleLarge;

  TextStyle? get b3M => b3?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get b3B => b3?.copyWith(fontWeight: FontWeight.w700);

  //endregion

  //region b2
  TextStyle? get b2 => Theme.of(context).textTheme.headlineSmall;

  TextStyle? get b2M => b2?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get b2B => b2?.copyWith(fontWeight: FontWeight.w700);

  //endregion

  //region b1
  TextStyle? get b1 =>
      Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30);

  TextStyle? get b1M => b1?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get b1B => b1?.copyWith(fontWeight: FontWeight.w700);

//endregion

}

extension TextStyleExtension on TextStyle? {
  TextStyle? get wCWhite => this?.copyWith(color: Colors.white);

  TextStyle? get wCChineseBlack =>
      this?.copyWith(color: AppColors.chineseBlack);

  TextStyle? get wCDarkGunmetal =>
      this?.copyWith(color: AppColors.darkGunmetal);

  TextStyle? get wCPlumpPurplePrimary =>
      this?.copyWith(color: AppColors.plumpPurplePrimary);

  TextStyle? get wCRhythm => this?.copyWith(color: AppColors.rhythm);

  TextStyle? get wCCrayola => this?.copyWith(color: AppColors.crayola);

  TextStyle? get wCSoap => this?.copyWith(color: AppColors.soap);

  TextStyle? get wCMagnolia => this?.copyWith(color: AppColors.magnolia);

  TextStyle? get wCEerieBlack => this?.copyWith(color: AppColors.eerieBlack);

  TextStyle? get wCGarnet => this?.copyWith(color: AppColors.garnet);

  TextStyle? get wCPastelRedSecondary =>
      this?.copyWith(color: AppColors.pastelRedSecondary);

  TextStyle? get wCLightSalmonPink =>
      this?.copyWith(color: AppColors.lightSalmonPink);

  TextStyle? get wCBabyPink => this?.copyWith(color: AppColors.babyPink);

  TextStyle? get wCPalePink => this?.copyWith(color: AppColors.palePink);

  TextStyle? get wCIsabelline => this?.copyWith(color: AppColors.isabelline);

  TextStyle? get wCError => this?.copyWith(color: AppColors.error);
}
