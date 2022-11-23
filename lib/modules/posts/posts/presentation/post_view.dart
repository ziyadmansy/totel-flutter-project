import 'package:cheffy/modules/main/main_view_model.dart';
import 'package:cheffy/modules/posts/posts/presentation/pages/finding_partner_posts_tab.dart';
import 'package:cheffy/modules/posts/posts/presentation/pages/share_room_posts_tab.dart';
import 'package:cheffy/modules/posts/posts/presentation/providers/posts_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/finding_partner_post_listing_item_view.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:cheffy/widgets/app_drawer.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsPageView extends StatefulWidget {
  const PostsPageView({super.key});

  @override
  State<PostsPageView> createState() => _PostsPageViewState();
}

class _PostsPageViewState extends State<PostsPageView> {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: SharedWidgets.buildHomeAppBar(
          title: mainViewModel.appBarTitle,
          onNotificationPressed: mainViewModel.onPressedNotifications,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Finding Partner",
              ),
              Tab(
                text: "Share rooms",
              ),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: [
            FindingPartnerPostsTab(),
            ShareRoomPostsTab(),
          ],
        ),
      ),
    );
  }
}
