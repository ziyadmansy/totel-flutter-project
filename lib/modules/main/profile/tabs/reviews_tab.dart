// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cheffy/modules/main/profile/profile/domain/entities/review_entity.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_vertical_layout_view.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/modules/widgets/review_listing_item/review_listing_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsTab extends StatefulWidget {
  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  @override
  void initState() {
    super.initState();
    final profileProvider = context.read<ProfileProvider>();
    profileProvider.getReviews();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return ProviderProgressLoader(
      isLoading: profileProvider.busy(profileProvider.reviews),
      child: profileProvider.reviews.isEmpty
          ? Center(
              child: Text('No reviews available. Try reviewing some hotels!'),
            )
          : ListView.separated(
              itemCount: profileProvider.reviews.length,
              itemBuilder: (context, i) {
                final review = profileProvider.reviews[i];
                return ReviewListingItemView(review);
              },
              separatorBuilder: (context, i) {
                return Divider();
              },
            ),
    );
  }
}
