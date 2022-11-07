import 'package:cheffy/modules/payment/presentation/summary/payment_details_page.dart';
import 'package:cheffy/modules/payment/presentation/summary/roommate_page.dart';
import 'package:flutter/material.dart';

class PaymentSummaryView extends StatelessWidget {
  const PaymentSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book a room'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Room for me'),
              Tab(text: 'Roommate'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              PaymentDetailsPage(),
              RoommatePage(),
            ],
          ),
        ),
      ),
    );
  }
}
