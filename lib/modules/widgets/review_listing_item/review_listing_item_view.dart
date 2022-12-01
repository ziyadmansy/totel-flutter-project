import 'package:cheffy/Utils/shared_core.dart';
import 'package:cheffy/modules/main/profile/profile/domain/entities/review_entity.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class ReviewListingItemView extends StatelessWidget {
  final ReviewEntity review;
  const ReviewListingItemView(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SharedWidgets.buildImageNetwork(
                height: 50,
                width: 50,
                imgUrl: review.user.avatar ?? '',
                fit: BoxFit.cover,
              ),
            ),
            title: Text('${review.user.firstName} ${review.user.lastName}'),
            subtitle: Text(review.hotel.name),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Chip(
                label: Text(
                  review.user.rating?.toStringAsFixed(1) ?? '0.0',
                  style: AppStyle.of(context).b5M,
                ),
                avatar: Image(
                  image: R.svg.ic_user_filled(width: 14, height: 14),
                  color: AppColors.pastelRedSecondary,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.soap),
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(
                  review.hotel.rating?.toStringAsFixed(1) ?? '0.0',
                  style: AppStyle.of(context).b5M,
                ),
                avatar: Icon(
                  Icons.star_rounded,
                  color: AppColors.profileGreen,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.soap),
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.title,
            style: AppStyle.of(context).b4B.wCChineseBlack,
          ),
          const SizedBox(height: 4),
          Text(
            review.desc,
            style: AppStyle.of(context).b5.wCRhythm,
          ),
          const SizedBox(height: 8),
          Text(
            SharedCore.getTimeAgoFromDate(review.datePosted),
            style: AppStyle.of(context).b5.wCCrayola,
          ),
        ],
      ),
    );
  }
}
