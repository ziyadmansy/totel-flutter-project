import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class PostListingItemVerticalLayoutView extends StatelessWidget {
  final User? user;
  final HotelEntity hotel;

  const PostListingItemVerticalLayoutView({
    super.key,
    required this.user,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      backgroundImage: user?.avatar,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 24,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user?.firstName ?? 'Albert'} ${user?.lastName ?? 'Flores'}',
                          style: AppStyle.of(context).b4M.wCChineseBlack,
                        ),
                        Text(
                          user?.gender ?? '',
                          style: AppStyle.of(context).b6.wCCrayola,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Chip(
                label: Text(
                  hotel.rate.toString(),
                  style: AppStyle.of(context).b5M.wCWhite,
                ),
                avatar: Image(
                  image: R.svg.ic_user_filled(width: 14, height: 14),
                ),
                backgroundColor: hotel.rate >= 3
                    ? AppColors.ratingNormal
                    : AppColors.ratingLow,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 260,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(hotel.imgUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(
                      UniversalVariables.kBorderRadius,
                    ),
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: Chip(
                    label: Text(
                      hotel.caption,
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
                  hotel.dateRange,
                  style: AppStyle.of(context).b5M.wCChineseBlack,
                ),
                side: BorderSide(color: AppColors.soap),
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                  side: BorderSide(color: AppColors.soap),
                ),
                onPressed: () {},
                child: Image(
                  image: R.svg.ic_bookmark(width: 10, height: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            hotel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.of(context).b4B.wCChineseBlack,
          ),
          Text(
            hotel.price.toStringAsFixed(2),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.of(context).b3M.wCChineseBlack,
          ),
        ],
      ),
    );
  }
}
