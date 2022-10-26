import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

import 'review_listing_item_view_model.dart';

class ReviewListingItemView
    extends ViewModelBuilderWidget<ReviewListingItemViewModel> {
  const ReviewListingItemView({super.key});

  @override
  Widget builder(BuildContext context, ReviewListingItemViewModel viewModel,
      Widget? child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const Image(
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=772&q=80",
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hilton Miami Downtowss',
                      style: AppStyle.of(context).b4.wCChineseBlack,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Albert Flores',
                      style: AppStyle.of(context).b5.wCRhythm,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Chip(
                label: Text(
                  '3.0',
                  style: AppStyle.of(context).b5M,
                ),
                avatar: Image(
                  image: R.svg.ic_user_filled(width: 14, height: 14),
                  color: AppColors.pastelRedSecondary,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.soap),
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(
                  '3.0',
                  style: AppStyle.of(context).b5M,
                ),
                avatar: Icon(
                  Icons.star_rounded,
                  color: AppColors.profileGreen,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.soap),
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Beautiful location',
            style: AppStyle.of(context).b4B.wCChineseBlack,
          ),
          const SizedBox(height: 4),
          Text(
            'Staff was very cordial and hotel was very clean and hygienic, rooms were very well maintained, only the complaint is food in the bar was not great and no variety in sea food was there',
            style: AppStyle.of(context).b5.wCRhythm,
          ),
          const SizedBox(height: 8),
          Text(
            '2 hours ago',
            style: AppStyle.of(context).b5.wCCrayola,
          ),
        ],
      ),
    );
  }

  @override
  ReviewListingItemViewModel viewModelBuilder(BuildContext context) =>
      ReviewListingItemViewModel();
}
