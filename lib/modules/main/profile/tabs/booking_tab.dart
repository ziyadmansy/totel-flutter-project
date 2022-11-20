// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cheffy/modules/main/profile/profile/domain/entities/review_entity.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/widgets/post_listing_item/post_listing_item_vertical_layout_view.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/modules/widgets/review_listing_item/review_listing_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingsTab extends StatefulWidget {
  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  @override
  void initState() {
    super.initState();
    final profileProvider = context.read<ProfileProvider>();
    profileProvider.getBookings();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return ProviderProgressLoader(
      isLoading: profileProvider.busy(profileProvider.bookings),
      child: profileProvider.bookings.isEmpty
          ? Center(
              child: Text(
                'No bookings available. Try booking some hotels!',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.separated(
              itemCount: profileProvider.bookings.length,
              itemBuilder: (context, i) {
                final booking = profileProvider.bookings[i];
                return ListTile(
                  title: Text(booking.id.toString()),
                );
              },
              separatorBuilder: (context, i) {
                return Divider();
              },
            ),
    );
  }
}
