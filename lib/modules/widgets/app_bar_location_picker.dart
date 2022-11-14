import 'package:cheffy/Utils/key.dart';
import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/app/app.dart';
import '../../core/enums/account_avatar_type.dart';
import '../../r.g.dart';
import '../theme/styles.dart';
import 'account_avatar.dart';

class AppBarLocationPicker extends StatelessWidget {
  final UserEntity? appUser;
  final dynamic location;
  final VoidCallback? onTapViewProfile;
  final VoidCallback? onTapChangeLocation;
  final VoidCallback? onNotificationPressed;

  const AppBarLocationPicker({
    Key? key,
    this.appUser,
    this.location,
    this.onTapViewProfile,
    this.onTapChangeLocation,
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            mainScreenScaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: AccountAvatar(
              type: AccountAvatarType.AppBar,
              url: appUser?.avatar == null
                  ? null
                  : '${Application.baseUrl}${appUser?.avatar}',
              viewCallback: onTapViewProfile,
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: BorderSide(color: AppColors.soap),
              ),
              onPressed: onNotificationPressed,
              child: Image(image: R.svg.ic_bell(width: 30, height: 30)),
            ),
            title: Text(
              'Location',
              style: AppStyle.of(context).b5.wCRhythm,
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  appUser?.city ?? 'Miami, Florida',
                  style: AppStyle.of(context).b4M,
                ),
                const SizedBox(width: 4),
                Image(
                  image: R.svg.ic_arrow_down(
                    width: 10.5,
                    height: 5.25,
                  ),
                )
              ],
            ),
            onTap: onTapChangeLocation,
          ),
        ),
      ],
    );
  }
}
