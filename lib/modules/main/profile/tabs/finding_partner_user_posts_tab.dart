import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/finding_partner_post_listing_item_view.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindingPartnerUserPostsTab extends StatefulWidget {
  const FindingPartnerUserPostsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<FindingPartnerUserPostsTab> createState() =>
      _FindingPartnerUserPostsTabState();
}

class _FindingPartnerUserPostsTabState
    extends State<FindingPartnerUserPostsTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final profileProvider = context.read<ProfileProvider>();
      profileProvider.getUserFindingPartnerPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return ProviderProgressLoader(
      isLoading: profileProvider.busy(profileProvider.findingPartnerPostEntity),
      child: profileProvider.findingPartnerPostEntity == null ||
              profileProvider.findingPartnerPostEntity!.posts.isEmpty
          ? Center(
              child: Text(
                'No posts available. Try adding new posts!',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.separated(
              itemCount: profileProvider.findingPartnerPostEntity!.posts.length,
              itemBuilder: (context, i) {
                final post = profileProvider.findingPartnerPostEntity!.posts[i];
                return FindingPartnerPostListingItemView(
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
