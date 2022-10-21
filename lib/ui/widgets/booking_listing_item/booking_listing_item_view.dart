import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/ui/theme/styles.dart';

import 'booking_listing_item_view_model.dart';

class BookingListingItemView
    extends ViewModelBuilderWidget<BookingListingItemViewModel> {
  const BookingListingItemView({super.key});

  @override
  Widget builder(BuildContext context, BookingListingItemViewModel viewModel,
      Widget? child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
              width: 135,
              height: 88,
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
                  "2nd June, 2022",
                  style: AppStyle.of(context).b5.wCRhythm,
                ),
                SizedBox(height: 12),
                Text(
                  "The Zuri White Sands Goa Resort and Casino",
                  style: AppStyle.of(context).b4M.wCChineseBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  BookingListingItemViewModel viewModelBuilder(BuildContext context) =>
      BookingListingItemViewModel();
}
