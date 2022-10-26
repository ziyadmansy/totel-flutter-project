import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

import 'profile_view_model.dart';

class ProfileHeaderView extends ViewModelWidget<ProfileViewModel> {
  const ProfileHeaderView({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
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
                  width: 93,
                  height: 93,
                  child: Stack(
                    fit: StackFit.expand,
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
                          backgroundImage: const NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/e844/bbc4/5d748df4986024140862b99b3bea1d4e?Expires=1661731200&Signature=TN9XGatjLWGWsVkXLqE1HOmhHbXIitngQ5KkaqGKkVROQPgh8f-72iaFgCWWTDmUdWC4XLVwZ0R7ou~8Gkj1zacJo8h2UNI3AKgoGy-zvhCPDN1mi-mzq8T2PQ1XUekLp2jKw3wyKSK-VyyalXmbAcNAWLS6W~TDDmJQnfF7Md19EdpbAXXMQZE75-tJp0MKZ0Kr8O--9RT4TePdyyA1sDzigXTbceK9jJRZ1sYqeI8-V9JCUxedFUwTUOtLtjV7z9do6XgXsdnTHBu3IZR1HrZy4EBSf1xQuylfi-6WYiva24ni5Tl4ud~PAVpnwn56~XcyU3ST1UdEQbzl5DYBsw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        left: 8,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.profileGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              Text(
                                "5.0",
                                style: TextStyle(color: Colors.white),
                              )
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
                        "Cameron Williamson",
                        style: AppStyle.of(context).b3M.wCChineseBlack,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Doctor",
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
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
              style: AppStyle.of(context).b4.wCChineseBlack,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: viewModel.onPosts,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.soap),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      side: BorderSide(color: AppColors.soap),
                    ),
                    child: Text(
                      '14 Posts',
                      style: AppStyle.of(context).b4M.wCChineseBlack,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                if (!viewModel.isMyProfile)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: viewModel.onMessage,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Text(
                        'Message',
                        style: AppStyle.of(context).b4M.wCWhite,
                      ),
                    ),
                  ),
                if (viewModel.isMyProfile)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: viewModel.onEdit,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: AppStyle.of(context).b4M.wCPlumpPurplePrimary,
                      ),
                    ),
                  ),
                const SizedBox(width: 16),
                CircleAvatar(
                  backgroundColor: AppColors.plumpPurplePrimary,
                  child: IconButton(
                    onPressed: viewModel.onBookmark,
                    icon: Image(
                      image: R.svg.ic_bookmark_filled(width: 24, height: 24),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
