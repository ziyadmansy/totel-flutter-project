import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/filter/filter_view.dart';
import 'package:cheffy/modules/widgets/main_app_bar.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';

import 'home_view_model.dart';

class HomePageView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomePageView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return SafeArea(
      bottom: false, // To make the body extend behind Bottom Nav
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MainAppBar(),
            const FilterView(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Fit in your choice',
                style: AppStyle.of(context).b3M,
              ),
            ),
            SizedBox(
              height: 282,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 8),
                  PostListingItemView(
                    layoutType: 1,
                    image: R.image.img_ad_1(),
                    dateRange: '4 Jun - 6 Jun',
                    title: 'Hilton Miami Downtown',
                    by: 'Albert Flores',
                    price: '\$90',
                    period: 'Day',
                    onTap: () => viewModel.onTapPost(),
                  ),
                  PostListingItemView(
                    layoutType: 1,
                    image: R.image.img_ad_2(),
                    dateRange: '4 Jun - 6 Jun',
                    title: 'Radisson RED Miami Airport',
                    by: 'Albert Flores',
                    price: '\$90',
                    period: 'Day',
                    onTap: () => viewModel.onTapPost(),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            // const SizedBox(height: 8),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Traveller in Miami',
                    style: AppStyle.of(context).b3M,
                  ),
                  Text(
                    '75 Posts',
                    style: AppStyle.of(context).b5.wCCrayola,
                  ),
                ],
              ),
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
            )
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
