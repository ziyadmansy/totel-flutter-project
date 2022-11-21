import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/images,dart.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class SearchHotelItemVerticalLayoutView extends StatelessWidget {
  final HotelEntity post;
  final VoidCallback? onPress;

  const SearchHotelItemVerticalLayoutView({
    super.key,
    required this.post,
    this.onPress,
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
                      /*CircleAvatar(
                        backgroundImage: NetworkImage(post.imageUrl ?? ''),
                        backgroundColor:
                        Theme.of(context).colorScheme.secondary,
                        radius: 24,
                      ),
                      const SizedBox(width: 12),*/
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.description ?? '',
                              style: AppStyle.of(context).b4M.wCChineseBlack,
                            ),
                            Text(
                              '${post.address ?? post.city}, ${post.city}' ??
                                  '',
                              style: AppStyle.of(context).b6.wCCrayola,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 260,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  post.hotelPhotos!.isEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                            UniversalVariables.kPostRadius,
                          ),
                          child: Image.network(
                            post.imageUrl,
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
                          itemCount: post.hotelPhotos!.length,
                          itemBuilder: (context, int i, int pageViewIndex) {
                            final attach = post.hotelPhotos![i];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(
                                UniversalVariables.kPostRadius,
                              ),
                              child: FadeInImage(
                                placeholder: AssetImage(AppImages.img_logo),
                                image: NetworkImage(attach.url),
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                  if (post.rating != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Chip(
                        label: Text(
                          post.rating.toString(),
                          style: AppStyle.of(context).b5M.wCWhite,
                        ),
                        avatar: Image(
                          image: R.svg.ic_user_filled(width: 14, height: 14),
                        ),
                        backgroundColor: post.rating! >= 3
                            ? AppColors.ratingNormal
                            : AppColors.ratingLow,
                      ),
                    ),
                  /*Positioned(
                    left: 12,
                    bottom: 12,
                    child: Chip(
                      label: Text(
                        post.address ?? '',
                        style: AppStyle.of(context).b5M.wCWhite,
                      ),
                      backgroundColor: AppColors.plumpPurplePrimary,
                    ),
                  ),*/
                ],
              ),
            ),
            /*Row(
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
                    post.type ?? '',
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                  side: BorderSide(color: AppColors.soap),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
              ],
            ),*/
            const SizedBox(height: 8),
            /*Text(
              'Partner Gender:',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.of(context).b4.wCDarkGunmetal,
            ),*/
            const SizedBox(height: 8),
            Text(
              post.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.of(context).b3B.wCChineseBlack,
            ),
          ],
        ),
      ),
    );
  }
}
