// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';

class HotelCardItem extends StatelessWidget {
  final HotelEntity hotel;
  final VoidCallback? onPress;
  const HotelCardItem({
    Key? key,
    required this.hotel,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 1.25,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPress,
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
                        imgUrl: hotel.imageUrl,
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
                            hotel.name + ', ' + (hotel.city ?? ''),
                            style: AppStyle.of(context).b4B.wCChineseBlack,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                hotel.rating?.toStringAsFixed(1) ?? '0.0',
                                style: AppStyle.of(context).b5.wCRhythm,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$${hotel.minPrice} - \$${hotel.maxPrice}',
                            style: AppStyle.of(context).b5B.wCChineseBlack,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
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
                        hotel.address ?? 'N/A',
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
    );
  }
}
