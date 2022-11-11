import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/app/app.dart';
import 'package:cheffy/core/enums/account_avatar_type.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/widgets/account_avatar.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/r.g.dart';
import 'package:flutter/material.dart';

class SharedWidgets {
  static AppBar buildHomeAppBar({
    required ProfileEntity? appUser,
    required dynamic location,
    required VoidCallback? onTapViewProfile,
    required VoidCallback? onTapChangeLocation,
    required VoidCallback? onNotificationPressed,
    required VoidCallback? onSearchPressed,
    PreferredSizeWidget? bottom,
  }) {
    return AppBar(
      title: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: AccountAvatar(
          type: AccountAvatarType.AppBar,
          url: appUser?.avatar == null
              ? null
              : '${Application.baseUrl}${appUser?.avatar}',
          viewCallback: onTapViewProfile,
        ),
        title: Text(
          '${appUser?.firstName ?? ''} ${appUser?.lastName ?? ''}',
          style: TextStyle(
            color: AppColors.rhythm,
          ),
        ),
        subtitle: Text(
          appUser?.city ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTapChangeLocation,
      ),
      bottom: bottom,
      actions: [
        AppBarActionButton(
          child: Center(
            child: Icon(
              Icons.search,
            ),
          ),
          onPressed: onSearchPressed,
        ),
        AppBarActionButton(
          child: Center(
            child: Icon(
              Icons.notifications,
              color: AppColors.plumpPurplePrimary,
            ),
          ),
          onPressed: onNotificationPressed,
        ),
      ],
    );
  }

  static AppBar buildAppBar(
      {required String title, PreferredSizeWidget? bottom}) {
    return AppBar(
      title: Text(title),
      bottom: bottom,
    );
  }

  static ListTile buildListTileTitle({required String title}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  static Widget buildSwitchListTile({
    required String title,
    required bool val,
    required void Function(bool)? onChange,
  }) {
    return SwitchListTile.adaptive(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      value: val,
      title: Text(title),
      onChanged: onChange,
    );
  }

  static Widget buildRoundedOutlinedButton({
    required Widget btnChild,
    required VoidCallback? onPress,
    bool isEnabled = true,
    Color? btnColor,
    bool isTooRounded = false,
  }) =>
      SizedBox(
        height: 48,
        child: OutlinedButton(
          child: btnChild,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                isTooRounded
                    ? UniversalVariables.kButtonBorderRadius
                    : UniversalVariables.kBorderRadius,
              ),
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
    bool isTooRounded = false,
  }) =>
      SizedBox(
        height: 40,
        child: TextButton(
          child: Text(btnText),
          style: ElevatedButton.styleFrom(
            foregroundColor: btnColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isTooRounded
                  ? UniversalVariables.kButtonBorderRadius
                  : UniversalVariables.kBorderRadius),
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
    bool isTooRounded = false,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        child: btnChild,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor ?? AppColors.plumpPurplePrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isTooRounded
                ? UniversalVariables.kButtonBorderRadius
                : UniversalVariables.kBorderRadius),
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
    bool isTooRounded = false,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton.icon(
        label: Text(btnText),
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isTooRounded
                ? UniversalVariables.kButtonBorderRadius
                : UniversalVariables.kBorderRadius),
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
