import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/profile/profile_header_view.dart';
import 'package:cheffy/modules/widgets/app_bar_action_button.dart';
import 'package:cheffy/modules/widgets/booking_listing_item/booking_listing_item_view.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';
import 'package:cheffy/modules/widgets/review_listing_item/review_listing_item_view.dart';

import 'profile_view_model.dart';

class ProfileView extends ViewModelBuilderWidget<ProfileViewModel> {
  final bool isMyProfile;

  const ProfileView({super.key, this.isMyProfile = true});

  @override
  Widget builder(
      BuildContext context, ProfileViewModel viewModel, Widget? child) {
    return DefaultTabController(
      length: 3,
      child: Material(
        child: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              title: const Text("@albertflores"),
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
                    tabs: [
                      Tab(child: Text("Posts")),
                      Tab(child: Text("Bookings")),
                      Tab(child: Text("Reviews")),
                    ],
                  ),
                ),
              ),
              actions: [
                AppBarActionButton(
                  onPressed: viewModel.onShare,
                  showElevation: false,
                  child: Image(image: R.svg.ic_share(width: 20, height: 20)),
                ),
                AppBarActionButton(
                  onPressed: viewModel.onWallet,
                  backgroundColor: AppColors.plumpPurplePrimary,
                  child: Image(image: R.svg.ic_wallet(width: 17, height: 17)),
                ),
              ],
            )
          ],
          body: TabBarView(
            children: [
              ListView.separated(
                itemBuilder: (context, index) => PostListingItemView(
                  layoutType: 2,
                  userImage: R.image.img_avatar_2(),
                  image: R.image.img_ad_1(),
                  dateRange: '4 Jun - 6 Jun',
                  title: 'Hilton Miami Downtown',
                  by: 'Albert Flores',
                  price: '\$90',
                  period: 'Day',
                  onTap: () => viewModel.onTapPost(),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: 5,
              ),
              ListView.separated(
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 4,
                  color: AppColors.soap,
                ),
                itemBuilder: (BuildContext context, int index) =>
                    const BookingListingItemView(),
              ),
              ListView.separated(
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 4,
                  color: AppColors.soap,
                ),
                itemBuilder: (BuildContext context, int index) =>
                    const ReviewListingItemView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) =>
      ProfileViewModel(isMyProfile);
}
