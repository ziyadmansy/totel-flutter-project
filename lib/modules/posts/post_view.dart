import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/posts/posts/posts_provider.dart';
import 'package:cheffy/widgets/app_drawer.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_view.dart';


class PostsPageView extends StatelessWidget {
  const PostsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    final postsProvider = context.watch<PostsProvider>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: SharedWidgets.buildHomeAppBar(
          title: mainViewModel.appBarTitle,
          onNotificationPressed: mainViewModel.onPressedNotifications,
        ),
        drawer: AppDrawer(),
        body: ListView(
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
              onTap: () => postsProvider.onTapPost(),
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
              onTap: () => postsProvider.onTapPost(),
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
              onTap: () => postsProvider.onTapPost(),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
