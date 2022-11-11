import 'package:cheffy/app/app.dart';
import 'package:cheffy/core/enums/account_avatar_type.dart';
import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/account_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class DrawerHeaderWidget extends ViewModelWidget<MainViewModel> {
  String getUserName(String? firstName, String? lastName) {
    String fullName = (firstName ?? '') + ' ' + (lastName ?? '');
    return fullName;
  }

  @override
  Widget build(BuildContext context, MainViewModel mainViewModel) {
    final profileProvider = context.watch<ProfileProvider>();
    return SizedBox(
      height: 220,
      child: DrawerHeader(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AccountAvatar(
                type: AccountAvatarType.Drawer,
                url: profileProvider.profileEntity?.avatar == null
                    ? null
                    : '${Application.baseUrl}${profileProvider.profileEntity?.avatar}',
                viewCallback: mainViewModel.onTapViewProfile,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                getUserName(
                  profileProvider.profileEntity?.firstName,
                  profileProvider.profileEntity?.lastName,
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
