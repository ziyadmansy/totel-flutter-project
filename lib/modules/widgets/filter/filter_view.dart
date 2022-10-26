import 'package:flutter/material.dart';

import '../../../r.g.dart';
import 'filter_item_view.dart';

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
            icon: R.svg.ic_calendar(width: 20, height: 20),
            label: 'Dates',
          ),
          const SizedBox(width: 8),
          FilterItemView(
            icon: R.svg.ic_user(width: 20, height: 20),
            label: 'Rating 4.0+',
          ),
          const SizedBox(width: 8),
          FilterItemView(
            icon: R.svg.ic_booking_status(width: 20, height: 20),
            label: 'Booking Status',
          ),
          const SizedBox(width: 8),
          FilterItemView(
            icon: R.svg.ic_wallet(width: 20, height: 20),
            label: 'Budget',
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
