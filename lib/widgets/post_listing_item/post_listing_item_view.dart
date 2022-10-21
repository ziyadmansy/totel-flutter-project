import 'package:cheffy/widgets/error_view.dart';
import 'package:flutter/material.dart';

import 'post_listing_item_layout_1_view.dart';
import 'post_listing_item_layout_2_view.dart';

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
      {required this.layoutType,
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
        return InkWell(
          onTap: onTap,
          child: PostListingItemLayout1View(
              image: image!,
              dateRange: dateRange,
              title: title,
              by: by,
              price: price,
              period: period),
        );
      case 2:
        return InkWell(
          onTap: onTap,
          child: PostListingItemLayout2View(
              userImage: userImage,
              image: image,
              dateRange: dateRange,
              title: title,
              description: description,
              by: by,
              price: price,
              period: period,
              rating: rating,
              type: type),
        );
      default:
        return ErrorView(message: 'unexpectedErrorOccurred');
    }
  }
}
