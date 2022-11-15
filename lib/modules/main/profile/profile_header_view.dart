import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

import 'profile_provider.dart';

class ProfileHeaderView extends StatelessWidget {
  const ProfileHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 76, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          right: 4,
                          bottom: 8,
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.rhythm,
                          backgroundImage:
                              profileProvider.profileEntity?.avatar == null
                                  ? null
                                  : NetworkImage(
                                      profileProvider.profileEntity!.avatar!,
                                    ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        left: 8,
                        bottom: -10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.profileGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${profileProvider.profileEntity?.rating}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${profileProvider.profileEntity?.firstName ?? ''} ${profileProvider.profileEntity?.lastName ?? ''}",
                        style: AppStyle.of(context).b3M.wCChineseBlack,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${profileProvider.profileEntity?.occupation?.name ?? ''}",
                        style: AppStyle.of(context).b4.wCRhythm,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Bio",
              style: AppStyle.of(context).b5M.wCCrayola,
            ),
            const SizedBox(height: 8),
            Text(
              profileProvider.profileEntity?.bio ?? 'No bio available',
              style: AppStyle.of(context).b4.wCChineseBlack,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: profileProvider.onPosts,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.soap),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      side: BorderSide(color: AppColors.soap),
                    ),
                    child: Text(
                      '${profileProvider.postEntity?.posts.length ?? 0} Posts',
                      style: AppStyle.of(context).b4M.wCChineseBlack,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // if (!viewModel.isMyProfile)
                AppBarActionButton(
                  child: Icon(Icons.message),
                  onPressed: profileProvider.onMessage,
                ),
                // if (viewModel.isMyProfile)
                AppBarActionButton(
                  child: Icon(Icons.edit),
                  onPressed: profileProvider.onEdit,
                ),
                const SizedBox(width: 16),
                AppBarActionButton(
                  child: Image(
                    image: R.svg.ic_bookmark_filled(width: 24, height: 24),
                  ),
                  backgroundColor: AppColors.plumpPurplePrimary,
                  onPressed: profileProvider.onEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
