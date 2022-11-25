import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/finding_partner_post_listing_item_view.dart';
import 'package:cheffy/modules/widgets/post_listing_item/share_room_post_listing_item_view.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShareRoomUserPostsTab extends StatefulWidget {
  const ShareRoomUserPostsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ShareRoomUserPostsTab> createState() => _ShareRoomUserPostsTabState();
}

class _ShareRoomUserPostsTabState extends State<ShareRoomUserPostsTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final profileProvider = context.read<ProfileProvider>();
      profileProvider.getUserShareRoomPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return ProviderProgressLoader(
      isLoading: profileProvider.busy(profileProvider.shareRoomPostEntity),
      child: profileProvider.shareRoomPostEntity == null ||
              profileProvider.shareRoomPostEntity!.posts.isEmpty
          ? Center(
              child: Text(
                'No posts available. Try adding new posts!',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.separated(
              itemCount: profileProvider.shareRoomPostEntity!.posts.length,
              itemBuilder: (context, i) {
                final post = profileProvider.shareRoomPostEntity!.posts[i];
                return ShareRoomPostListingItemView(
                  post: post,
                  onDelete: () async {
                    await profileProvider.deletePost(post.id);
                  },
                );
              },
              separatorBuilder: (context, i) {
                return Divider();
              },
            ),
    );
  }
}
