import 'package:cheffy/Utils/images,dart.dart';
import 'package:cheffy/widgets/filters/FilterItemView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),
          FilterItemView(
            icon: AppImages.ic_calendar,
            label: 'Dates',
          ),
          const SizedBox(width: 8),
          FilterItemView(
            icon: (AppImages.ic_user),
            label: 'Rating 4.0+',
          ),
          const SizedBox(width: 8),
          FilterItemView(
            icon: (AppImages.ic_booking_status),
            label: 'Booking Status',
          ),
          const SizedBox(width: 8),
          FilterItemView(
            icon: (AppImages.ic_wallet),
            label: 'Budget',
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
