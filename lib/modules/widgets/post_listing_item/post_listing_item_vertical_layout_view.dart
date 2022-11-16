import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class PostListingItemVerticalLayoutView extends StatelessWidget {
  final Post post;
  final VoidCallback? onPress;
  final VoidCallback? onDelete;

  const PostListingItemVerticalLayoutView({
    super.key,
    required this.post,
    this.onPress,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(post.user.avatar ?? ''),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 24,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${post.user.firstName} ${post.user.lastName}',
                            style: AppStyle.of(context).b4M.wCChineseBlack,
                          ),
                          Text(
                            post.user.occupation?.name ?? '',
                            style: AppStyle.of(context).b6.wCCrayola,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  elevation: 16,
                  color: AppColors.soap,
                  itemBuilder: (context) {
                    return [
                      if (onPress != null)
                        PopupMenuItem(
                          child: Text('View'),
                          onTap: onPress,
                        ),
                      if (onDelete != null)
                        PopupMenuItem(
                          child: Text('Delete'),
                          onTap: onDelete,
                        ),
                    ];
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              post.messageToPartner,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 260,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  post.attachments.isEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                            UniversalVariables.kPostRadius,
                          ),
                          child: Image.network(
                            post.hotel.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        )
                      : CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 240,
                            autoPlay: true,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                          ),
                          itemCount: post.attachments.length,
                          itemBuilder: (context, int i, int pageViewIndex) {
                            final attach = post.attachments[i];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(
                                UniversalVariables.kPostRadius,
                              ),
                              child: Image.network(
                                attach.url,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                  if (post.hotel.rating != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Chip(
                        label: Text(
                          post.hotel.rating.toString(),
                          style: AppStyle.of(context).b5M.wCWhite,
                        ),
                        avatar: Image(
                          image: R.svg.ic_user_filled(width: 14, height: 14),
                        ),
                        backgroundColor: post.hotel.rating! >= 3
                            ? AppColors.ratingNormal
                            : AppColors.ratingLow,
                      ),
                    ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Chip(
                      label: Text(
                        post.postingType,
                        style: AppStyle.of(context).b5M.wCWhite,
                      ),
                      backgroundColor: AppColors.plumpPurplePrimary,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    '${UniversalVariables.dayMonthDateFormat.format(post.startDate)} - ${UniversalVariables.dayMonthDateFormat.format(post.endDate)}',
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                  side: BorderSide(color: AppColors.soap),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
                Chip(
                  label: Text(
                    post.hotel.type ?? '',
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                  side: BorderSide(color: AppColors.soap),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Partner Gender: ${post.partnerGender}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.of(context).b4.wCDarkGunmetal,
            ),
            const SizedBox(height: 8),
            Text(
              '${post.hotel.name}, ${post.location}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.of(context).b3B.wCChineseBlack,
            ),
            Text(
              '\$${post.paymentAmountPerNight.toStringAsFixed(2)} / Night',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.of(context).b4B.wCChineseBlack,
            ),
          ],
        ),
      ),
    );
  }
}
