import 'package:cheffy/modules/posts/posts/presentation/providers/posts_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/share_room_post_listing_item_view.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShareRoomPostsTab extends StatefulWidget {
  const ShareRoomPostsTab({super.key});

  @override
  State<ShareRoomPostsTab> createState() => _ShareRoomPostsTabState();
}

class _ShareRoomPostsTabState extends State<ShareRoomPostsTab> {
  @override
  void initState() {
    super.initState();
    final postsProvider = context.read<PostsProvider>();
    Future.delayed(
      Duration.zero,
      () {
        postsProvider.getShareRoomPosts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final postsProvider = context.watch<PostsProvider>();
    return ProviderProgressLoader(
      isLoading: postsProvider.busy(postsProvider.shareRoomPostEntity),
      child: postsProvider.shareRoomPostEntity == null ||
              postsProvider.shareRoomPostEntity!.posts.isEmpty
          ? Center(
              child: Text(
                'No share rooms posts available, please try again later',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              itemCount: postsProvider.shareRoomPostEntity!.posts.length,
              itemBuilder: (context, i) {
                final postItem = postsProvider.shareRoomPostEntity!.posts[i];
                return ShareRoomPostListingItemView(
                  post: postItem,
                  onPress: () {
                    postsProvider.onTapShareRoomPost(postItem);
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
