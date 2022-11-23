import 'package:cheffy/modules/posts/posts/presentation/providers/posts_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/finding_partner_post_listing_item_view.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindingPartnerPostsTab extends StatefulWidget {
  const FindingPartnerPostsTab({super.key});

  @override
  State<FindingPartnerPostsTab> createState() => _FindingPartnerPostsTabState();
}

class _FindingPartnerPostsTabState extends State<FindingPartnerPostsTab> {
  @override
  void initState() {
    super.initState();
    final postsProvider = context.read<PostsProvider>();
    Future.delayed(
      Duration.zero,
      () {
        postsProvider.getFindingPartnerPosts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final postsProvider = context.watch<PostsProvider>();
    return ProviderProgressLoader(
      isLoading: postsProvider.busy(postsProvider.findingPartnerPostEntity),
      child: postsProvider.findingPartnerPostEntity == null ||
              postsProvider.findingPartnerPostEntity!.posts.isEmpty
          ? Center(
              child: Text(
                'No finding partners posts available, please try again later',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              itemCount: postsProvider.findingPartnerPostEntity!.posts.length,
              itemBuilder: (context, i) {
                final postItem =
                    postsProvider.findingPartnerPostEntity!.posts[i];
                return FindingPartnerPostListingItemView(
                  post: postItem,
                  onPress: () {
                    postsProvider.onTapFindingPartnerPost(postItem);
                  },
                  // Users can't delete public posts
                  onDelete: null,
                );
              },
              separatorBuilder: (context, i) {
                return Divider();
              },
            ),
    );
  }
}
