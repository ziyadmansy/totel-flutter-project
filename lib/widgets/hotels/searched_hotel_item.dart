// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/modules/main/discover/domain/entities/booking_hotel_entity.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:super_banners/super_banners.dart';

class SearchedHotelItem extends StatelessWidget {
  final BookingHotelEntity hotel;
  final VoidCallback? onPress;
  const SearchedHotelItem({
    Key? key,
    required this.hotel,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Card(
          child: InkWell(
            onTap: onPress,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SharedWidgets.buildImageNetwork(
                          imgUrl: hotel.mainPhotoUrl ?? '',
                          width: width / 3,
                          height: width / 4,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.hotelName ?? '' + ', ' + (hotel.city ?? ''),
                              style: AppStyle.of(context).b4B.wCChineseBlack,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${hotel.reviewScore?.toStringAsFixed(1) ?? '0.0'} (${hotel.reviewNr ?? '0'})',
                                  style: AppStyle.of(context).b5.wCRhythm,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${hotel.minTotalPrice ?? '(Confidential Price)'} ${hotel.currencyCode}',
                              style: AppStyle.of(context).b4M.wCChineseBlack,
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Check in',
                                  style:
                                      AppStyle.of(context).b4B.wCChineseBlack,
                                ),
                                Text(
                                  '${hotel.checkin.from} : ${hotel.checkin.until}',
                                  style: AppStyle.of(context).b4.wCRhythm,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Check out',
                                  style:
                                      AppStyle.of(context).b4B.wCChineseBlack,
                                ),
                                Text(
                                  '${hotel.checkout.from} : ${hotel.checkout.until}',
                                  style: AppStyle.of(context).b4.wCRhythm,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: R.svg.ic_marker_outline(width: 22, height: 22),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          hotel.timezone ?? 'N/A',
                          style: AppStyle.of(context).b5.wCRhythm,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (hotel.ribbonText != null)
          Positioned(
            top: 4,
            left: 4,
            child: CornerBanner(
              bannerPosition: CornerBannerPosition.topLeft,
              bannerColor: AppColors.soap,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(hotel.ribbonText!),
              ),
            ),
          ),
        if (hotel.soldout == 1)
          Positioned(
            top: 4,
            right: 4,
            child: CornerBanner(
              bannerPosition: CornerBannerPosition.topRight,
              bannerColor: AppColors.pastelRedSecondary,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'SOLD OUT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
