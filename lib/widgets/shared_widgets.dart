import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:flutter/material.dart';

class SharedWidgets {
  static AppBar buildAppBar({required String title}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  static Widget buildRoundedOutlinedButton({
    required Widget btnChild,
    required VoidCallback? onPress,
    bool isEnabled = true,
    Color? btnColor,
  }) =>
      SizedBox(
        height: 48,
        child: OutlinedButton(
          child: btnChild,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(UniversalVariables.kButtonBorderRadius),
            ),
            backgroundColor: btnColor,
          ),
          onPressed: isEnabled ? onPress : null,
        ),
      );

  static Widget buildTextButton({
    required String btnText,
    required VoidCallback onPress,
    bool isEnabled = true,
    Color? btnColor,
  }) =>
      SizedBox(
        height: 40,
        child: TextButton(
          child: Text(btnText),
          style: ElevatedButton.styleFrom(
            foregroundColor: btnColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(UniversalVariables.kButtonBorderRadius),
            ),
          ),
          onPressed: isEnabled ? onPress : null,
        ),
      );

  static Widget buildRoundedElevatedButton({
    required Widget btnChild,
    required VoidCallback? onPress,
    Color? btnColor,
    bool isEnabled = true,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        child: btnChild,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor ?? AppColors.plumpPurplePrimary,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(UniversalVariables.kButtonBorderRadius),
          ),
        ),
        onPressed: isEnabled ? onPress : null,
      ),
    );
  }

  static Widget buildRoundedIconElevatedButton({
    required String btnText,
    required IconData icon,
    required VoidCallback? onPress,
    Color? btnColor,
    bool isEnabled = true,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton.icon(
        label: Text(btnText),
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(UniversalVariables.kButtonBorderRadius),
          ),
        ),
        onPressed: isEnabled ? onPress : null,
        icon: Icon(icon),
      ),
    );
  }

  static Widget buildBalanceRow(
      {required String title, required double balance}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        Text(
          balance.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
