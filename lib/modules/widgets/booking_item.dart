// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/r.g.dart';
import 'package:flutter/material.dart';

import 'package:cheffy/modules/main/profile/profile/domain/entities/booking_entity.dart';

class BookingItem extends StatelessWidget {
  final BookingEntity bookingEntity;
  final VoidCallback? onPress;

  const BookingItem({
    Key? key,
    required this.bookingEntity,
    this.onPress,
  }) : super(key: key);

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
                        backgroundImage:
                            NetworkImage(bookingEntity.user.avatar ?? ''),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 24,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${bookingEntity.user.firstName} ${bookingEntity.user.lastName}',
                            style: AppStyle.of(context).b4M.wCChineseBlack,
                          ),
                          Text(
                            bookingEntity.user.occupation?.name ?? '',
                            style: AppStyle.of(context).b6.wCCrayola,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (onPress != null)
                  PopupMenuButton<String>(
                    elevation: 16,
                    color: AppColors.soap,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text('View'),
                          onTap: onPress,
                        ),
                      ];
                    },
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              bookingEntity.roomType,
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
                  bookingEntity.hotel.attachments.isEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                            UniversalVariables.kPostRadius,
                          ),
                          child: Image.network(
                            bookingEntity.hotel.imageUrl,
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
                          itemCount: bookingEntity.hotel.attachments.length,
                          itemBuilder: (context, int i, int pageViewIndex) {
                            final attach = bookingEntity.hotel.attachments[i];
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
                  if (bookingEntity.hotel.rating != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Chip(
                        label: Text(
                          bookingEntity.hotel.rating.toString(),
                          style: AppStyle.of(context).b5M.wCWhite,
                        ),
                        avatar: Image(
                          image: R.svg.ic_user_filled(width: 14, height: 14),
                        ),
                        backgroundColor: bookingEntity.hotel.rating! >= 3
                            ? AppColors.ratingNormal
                            : AppColors.ratingLow,
                      ),
                    ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Chip(
                      label: Text(
                        bookingEntity.bookingStatus,
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
                    '${UniversalVariables.dayMonthDateFormat.format(bookingEntity.checkInDate)} - ${UniversalVariables.dayMonthDateFormat.format(bookingEntity.checkOutDate)}',
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                  side: BorderSide(color: AppColors.soap),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
                Chip(
                  label: Text(
                    bookingEntity.paymentOption,
                    style: AppStyle.of(context).b5M.wCChineseBlack,
                  ),
                  side: BorderSide(color: AppColors.soap),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              bookingEntity.hotel.name,
              style: AppStyle.of(context).b3B.wCChineseBlack,
            ),
            const SizedBox(height: 8),
            Text(
              '${bookingEntity.amount.toStringAsFixed(2)} ${bookingEntity.currency}',
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
