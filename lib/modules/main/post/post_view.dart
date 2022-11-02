import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';

import 'post_view_model.dart';

class PostsPageView extends ViewModelBuilderWidget<PostViewModel> {
  const PostsPageView({super.key});

  @override
  Widget builder(BuildContext context, PostViewModel viewModel, Widget? child) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Text('My Posts'),
          ),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Live'),
              Tab(text: 'Expired'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                const SizedBox(width: 8),
                PostListingItemView(
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
                PostListingItemView(
                  layoutType: 2,
                  userImage: R.image.img_avatar_3(),
                  image: R.image.img_ad_2(),
                  dateRange: '4 Jun - 6 Jun',
                  title: 'Radisson RED Miami Airport',
                  by: 'Albert Flores',
                  price: '\$90',
                  period: 'Day',
                  type: 2,
                  rating: 2,
                  onTap: () => viewModel.onTapPost(),
                ),
                PostListingItemView(
                  layoutType: 2,
                  userImage: R.image.img_avatar_3(),
                  image: R.image.img_ad_2(),
                  dateRange: '4 Jun - 6 Jun',
                  title: 'Radisson RED Miami Airport',
                  by: 'Albert Flores',
                  price: '\$90',
                  period: 'Day',
                  type: 3,
                  onTap: () => viewModel.onTapPost(),
                ),
                const SizedBox(width: 8),
              ],
            ),
            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                const SizedBox(width: 8),
                PostListingItemView(
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
                PostListingItemView(
                  layoutType: 2,
                  userImage: R.image.img_avatar_3(),
                  image: R.image.img_ad_2(),
                  dateRange: '4 Jun - 6 Jun',
                  title: 'Radisson RED Miami Airport',
                  by: 'Albert Flores',
                  price: '\$90',
                  period: 'Day',
                  type: 2,
                  rating: 2,
                  onTap: () => viewModel.onTapPost(),
                ),
                PostListingItemView(
                  layoutType: 2,
                  userImage: R.image.img_avatar_3(),
                  image: R.image.img_ad_2(),
                  dateRange: '4 Jun - 6 Jun',
                  title: 'Radisson RED Miami Airport',
                  by: 'Albert Flores',
                  price: '\$90',
                  period: 'Day',
                  type: 3,
                  onTap: () => viewModel.onTapPost(),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  PostViewModel viewModelBuilder(BuildContext context) => PostViewModel();
}
