// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_vertical_layout_view.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:provider/provider.dart';

class PostsTab extends StatelessWidget {
  final PostsEntity? postEntity;

  const PostsTab({
    Key? key,
    required this.postEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return ProviderProgressLoader(
      isLoading: profileProvider.busy(profileProvider.postEntity),
      child: postEntity == null || postEntity!.posts.isEmpty
          ? Center(
              child: Text('No posts available. Try adding new posts!'),
            )
          : ListView.builder(
              itemCount: postEntity!.posts.length,
              itemBuilder: (context, i) {
                final post = postEntity!.posts[i];
                return PostListingItemVerticalLayoutView(
                  post: post,
                  onDelete: () async {
                    await profileProvider.deletePost(post.id);
                  },
                );
              },
            ),
    );
  }
}
