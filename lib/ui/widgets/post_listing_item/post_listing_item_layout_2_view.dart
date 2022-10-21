import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';

class PostListingItemLayout2View extends StatelessWidget {
  final ImageProvider? userImage;
  final ImageProvider? image;
  final String dateRange;
  final String title;
  final String? description;
  final String by;
  final String price;
  final String period;
  final double rating;
  final String? date;
  final int type;

  const PostListingItemLayout2View({
    super.key,
    required this.userImage,
    this.image,
    required this.dateRange,
    required this.title,
    this.description,
    required this.by,
    required this.price,
    required this.period,
    this.rating = 3.0,
    this.type = 1,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Theme.of(context).colorScheme.surface,
      //   borderRadius: BorderRadius.circular(20),
      //   // boxShadow: [
      //   //   BoxShadow(
      //   //     color: Theme.of(context).colorScheme.shadow,
      //   //     offset: const Offset(0, 2),
      //   //     blurRadius: 12,
      //   //   ),
      //   // ],
      // ),
      child: Column(
        children: [
          Padding(
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
                            backgroundImage: userImage,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            radius: 24,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                by,
                                style: AppStyle.of(context).b4M.wCChineseBlack,
                              ),
                              Text(
                                date ?? 'March 24, 2022',
                                style: AppStyle.of(context).b6.wCCrayola,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Chip(
                      label: Text(
                        '$rating',
                        style: AppStyle.of(context).b5M.wCWhite,
                      ),
                      avatar: Image(
                        image: R.svg.ic_user_filled(width: 14, height: 14),
                      ),
                      backgroundColor: rating >= 3
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
                        // child: Image(
                        //   image: image!,
                        //   fit: BoxFit.cover,
                        // ),

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: image!,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                      ),
                      Positioned(
                        left: 12,
                        bottom: 12,
                        child: Chip(
                          label: Text(
                            type == 1
                                ? 'Male only'
                                : type == 2
                                    ? 'Female only'
                                    : 'Finding Partner',
                            style: AppStyle.of(context).b5M.wCWhite,
                          ),
                          backgroundColor: AppColors.plumpPurplePrimary,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      label: Text(
                        dateRange,
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
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.of(context).b4B.wCChineseBlack,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text(
                      price,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.of(context).b3M.wCChineseBlack,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '/ $period',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.of(context).b5.wCChineseBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
