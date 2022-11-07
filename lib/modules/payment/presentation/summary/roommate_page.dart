import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:cheffy/widgets/roommate_card.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class RoommatePage extends StatelessWidget {
  const RoommatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = context.watch<PaymentViewModel>();
    return ListView.builder(
      itemCount: paymentProvider.roommates.length,
      itemBuilder: (context, i) {
        final roommateData = paymentProvider.roommates[i];
        return RoommateCard(
          roommateData: roommateData,
          primaryBtnText: 'Add',
          secondaryBtnText: 'Message',
          onPrimaryBtnPressed: paymentProvider.onRoommateAdd,
          onSecondaryBtnPressed: () {},
        );
      },
    );
  }
}
