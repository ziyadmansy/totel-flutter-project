import 'package:cheffy/modules/payment/presentation/payment_view_model.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RoommatePage extends ViewModelWidget<PaymentViewModel> {
  const RoommatePage({super.key});

  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.roommates.length,
      itemBuilder: (context, i) {
        final roommateData = viewModel.roommates[i];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    roommateData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    roommateData.occupation,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      roommateData.imgUrl,
                    ),
                  ),
                ),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text('Email'),
                          subtitle: Text(roommateData.email),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text('Contact No.'),
                          subtitle: Text(roommateData.contactNo),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SharedWidgets.buildRoundedElevatedButton(
                          btnChild: Text('Add'),
                          onPress: viewModel.onRoommateAdd,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: SharedWidgets.buildRoundedOutlinedButton(
                          btnChild: Text('Message'),
                          onPress: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
