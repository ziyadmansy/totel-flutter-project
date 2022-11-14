import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/app/constants/error_messages.dart';
import 'package:cheffy/modules/widgets/error_view.dart';

import 'post_listing_item_horizontal_layout_view.dart';
import 'post_listing_item_vertical_layout_view.dart';

class PostListingItemView extends StatelessWidget {
  final int layoutType;
  final ImageProvider? userImage;
  final ImageProvider? image;
  final String dateRange;
  final String title;
  final String? description;
  final String by;
  final String price;
  final String period;
  final double rating;
  final int type;
  final VoidCallback onTap;

  const PostListingItemView(
      {super.key,
      required this.layoutType,
      this.userImage,
      this.image,
      required this.dateRange,
      required this.title,
      this.description,
      required this.by,
      required this.price,
      required this.period,
      this.rating = 3.0,
      this.type = 1,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    switch (layoutType) {
      case 1:
        return PostListingItemHorizontalLayoutView(
          onPress: onTap,
          image: image!,
          dateRange: dateRange,
          title: title,
          by: by,
          price: price,
          period: period,
        );
      // case 2:
      //   return PostListingItemVerticalLayoutView(
      //     user: null,
      //     hotel: HotelEntity(
      //       id: 0,
      //       name: 'Hilton Miami Downtown',
      //       caption: 'Caption',
      //       imgUrl: '',
      //       price: 99,
      //       rate: 3.0,
      //       dateRange: '4 Jun - 6 Jun',
      //     ),
      //   );
      default:
        return ErrorView(message: ErrorMessages.unexpectedErrorOccurred);
    }
  }
}
