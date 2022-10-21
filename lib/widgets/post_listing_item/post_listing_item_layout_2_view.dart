import 'package:cheffy/Utils/images,dart.dart';
import 'package:cheffy/Utils/theme/color.dart';
import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/r.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Column(
      children: [
        SizedBox(height: 27),
        Container(
          // elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 24),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
          // margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                    avatar: SvgPicture.asset(
                      AppImages.ic_user_filled,
                      width: 14,
                      height: 14,
                    ),
                    backgroundColor: rating >= 3
                        ? AppColors.ratingNormal
                        : AppColors.ratingLow,
                  ),
                ],
              ),
              SizedBox(height: 13),
              SizedBox(
                height: 260,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      child: Image(
                        image: image!,
                        fit: BoxFit.fill,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      // padding: EdgeInsetsDirectional.all(20),
                    ),
                    Positioned(
                      left: 12,
                      bottom: 12,
                      child: Chip(
                        label: Row(
                          children: [
                            SvgPicture.asset(AppImages.ic_tag),
                            Text(
                              '5.0',
                              // type == 1
                              //     ? 'Male only'
                              //     : type == 2
                              //         ? 'Female only'
                              //         : 'Finding Partner',
                              style: AppStyle.of(context).b6M.wCWhite,
                            ),
                          ],
                        ),
                        backgroundColor: Color(0xff1A8F3A),
                        // type == 1
                        //     ? AppColors.
                        //     : AppColors.pastelRedSecondary,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 13),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    label: Text(
                      dateRange,
                      style: AppStyle.of(context).b5M.wCChineseBlack,
                    ),
                    side: BorderSide(color: AppColors.soap),
                    // backgroundColor: Theme.of(context).colorScheme.background,
                    backgroundColor:
                        // Colors.white,
                        Theme.of(context).colorScheme.surface,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const CircleBorder(),
                      side: BorderSide(color: AppColors.soap),
                    ),
                    onPressed: () {},
                    child: SvgPicture.asset(
                      AppImages.ic_bookmark,
                      width: 10,
                      height: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.of(context).b4B.wCChineseBlack,
              ),
              SizedBox(height: 5),
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
                    style: AppStyle.of(context).b4M.wCChineseBlack,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/ $period',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                ],
              ),
              SizedBox(height: 30),
              // ],
              // ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
