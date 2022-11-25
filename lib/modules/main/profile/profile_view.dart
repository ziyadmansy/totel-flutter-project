import 'package:cheffy/modules/main/profile/tabs/booking_tab.dart';
import 'package:cheffy/modules/main/profile/tabs/finding_partner_user_posts_tab.dart';
import 'package:cheffy/modules/main/profile/tabs/reviews_tab.dart';
import 'package:cheffy/modules/main/profile/tabs/share_room_user_posts_tab.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/main/profile/profile_header_view.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';

import 'profile_provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    final profileProvider = context.read<ProfileProvider>();
    Future.delayed(Duration.zero, () {
      profileProvider.getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return BackgroundProgress<ProfileProvider>(
      child: DefaultTabController(
        length: 4,
        child: Material(
          child: NestedScrollView(
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                title: Text('Profile'),
                backgroundColor: Colors.white,
                pinned: true,
                flexibleSpace: const FlexibleSpaceBar(
                  background: ProfileHeaderView(),
                ),
                expandedHeight: 350,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Container(
                    color: Colors.white,
                    child: const TabBar(
                      isScrollable: true,
                      tabs: [
                        Tab(
                          text: "Partner Posts",
                        ),
                        Tab(
                          text: "Room Posts",
                        ),
                        Tab(
                          text: "Bookings",
                        ),
                        Tab(
                          text: "Reviews",
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  AppBarActionButton(
                    onPressed: profileProvider.onShare,
                    showElevation: true,
                    child: Image(image: R.svg.ic_share(width: 20, height: 20)),
                  ),
                  AppBarActionButton(
                    onPressed: profileProvider.onWallet,
                    backgroundColor: AppColors.plumpPurplePrimary,
                    child: Image(image: R.svg.ic_wallet(width: 17, height: 17)),
                  ),
                ],
              )
            ],
            body: TabBarView(
              children: [
                FindingPartnerUserPostsTab(),
                ShareRoomUserPostsTab(),
                BookingsTab(),
                ReviewsTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
