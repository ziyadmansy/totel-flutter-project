import 'package:cheffy/ui/views/auth/auth/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/app/app.dart';
import 'package:cheffy/core/models/data/app_user_entity.dart';

import '../../core/enums/account_avatar_type.dart';
import '../../r.g.dart';
import '../theme/styles.dart';
import 'account_avatar.dart';

class AppBarLocationPicker extends StatelessWidget {
  final ProfileEntity? appUser;
  final dynamic location;
  final VoidCallback? onTapViewProfile;
  final VoidCallback? onTapChangeLocation;

  const AppBarLocationPicker(
      {Key? key,
      this.appUser,
      this.location,
      this.onTapViewProfile,
      this.onTapChangeLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AccountAvatar(
          type: AccountAvatarType.AppBar,
          url: '${Application.baseUrl}${appUser?.avatar}',
          viewCallback: onTapViewProfile,
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: onTapChangeLocation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: AppStyle.of(context).b5.wCRhythm,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Miami, Florida',
                    style: AppStyle.of(context).b4M,
                  ),
                  const SizedBox(width: 4),
                  Image(image: R.svg.ic_arrow_down(width: 10.5, height: 5.25))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
