import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_vertical_layout_view.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final profileProvider = context.read<ProfileProvider>();
      profileProvider.getUserPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return ProviderProgressLoader(
      isLoading: profileProvider.busy(profileProvider.postEntity),
      child: profileProvider.postEntity == null || profileProvider.postEntity!.posts.isEmpty
          ? Center(
              child: Text(
                'No posts available. Try adding new posts!',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.separated(
              itemCount: profileProvider.postEntity!.posts.length,
              itemBuilder: (context, i) {
                final post = profileProvider.postEntity!.posts[i];
                return PostListingItemVerticalLayoutView(
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
