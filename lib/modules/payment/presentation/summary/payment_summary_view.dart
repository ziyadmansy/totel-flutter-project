import 'package:cheffy/modules/payment/presentation/summary/payment_details_page.dart';
import 'package:cheffy/modules/payment/presentation/summary/roommate_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../payment_view_model.dart';

class PaymentSummaryView extends ViewModelBuilderWidget<PaymentViewModel> {
  const PaymentSummaryView({super.key});

  @override
  Widget builder(
      BuildContext context, PaymentViewModel viewModel, Widget? child) {
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

  @override
  bool get disposeViewModel => false;

  @override
  PaymentViewModel viewModelBuilder(BuildContext context) => PaymentViewModel();
}
