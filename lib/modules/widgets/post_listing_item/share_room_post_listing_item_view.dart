import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/share_room_post_entity.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class ShareRoomPostListingItemView extends StatelessWidget {
  final ShareRoomPost post;
  final VoidCallback? onPress;
  final VoidCallback? onDelete;

  const ShareRoomPostListingItemView({
    super.key,
    required this.post,
    this.onPress,
    this.onDelete,
  });

  Widget buildListTileRow({
    required String title,
    required String value,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
      ),
      trailing: Container(
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.darkGunmetal,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

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
              post.message,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            buildListTileRow(
              title: 'Category',
              value: post.category.name,
            ),
            Divider(),
            buildListTileRow(
              title: 'Charge per night',
              value: '\$${post.chargePerNight.toStringAsFixed(2)}',
            ),
            Divider(),
            buildListTileRow(
              title: 'Price per group',
              value: '\$${post.pricePerGroupSize.toStringAsFixed(2)}',
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    '${post.checkinTimeFrom} - ${post.checkinTimeTo}',
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                  side: BorderSide(color: AppColors.soap),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
                Chip(
                  label: Text(
                    post.postingType,
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                  side: BorderSide(color: AppColors.soap),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
