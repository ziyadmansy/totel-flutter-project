// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cheffy/modules/payment/data/models/roommate_model.dart';
import 'package:cheffy/widgets/shared_widgets.dart';

class RoommateCard extends StatelessWidget {
  const RoommateCard({
    Key? key,
    required this.roommateData,
    required this.primaryBtnText,
    required this.secondaryBtnText,
    required this.onPrimaryBtnPressed,
    required this.onSecondaryBtnPressed,
  }) : super(key: key);

  final RoommateModel roommateData;
  final String primaryBtnText;
  final String secondaryBtnText;
  final VoidCallback onPrimaryBtnPressed;
  final VoidCallback onSecondaryBtnPressed;

  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text('Check in'),
                      subtitle: Text(roommateData.checkIn),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text('Check out'),
                      subtitle: Text(roommateData.checkOut),
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
                      btnChild: Text(primaryBtnText),
                      onPress: onPrimaryBtnPressed,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SharedWidgets.buildRoundedOutlinedButton(
                      btnChild: Text(secondaryBtnText),
                      onPress: onSecondaryBtnPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
