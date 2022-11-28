import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

import '../../../../r.g.dart';

class PostTypeSelectionView extends StatelessWidget {
  final VoidCallback onShareRoomPressed;
  final VoidCallback onFindingPartnerPressed;

  const PostTypeSelectionView({
    super.key,
    required this.onShareRoomPressed,
    required this.onFindingPartnerPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: onShareRoomPressed,
              child: _typeShareRoomButton(context),
            ),
            SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: onFindingPartnerPressed,
              child: _typeFindingPartnerButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typeShareRoomButton(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  focal: Alignment.centerLeft,
                  focalRadius: 0.5,
                  radius: 0.5,
                  colors: [
                    AppColors.bookedGradientEnd,
                    AppColors.bookedGradientStart,
                    AppColors.bookedGradientEnd,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            child: Image(
              image: R.image.img_booked(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            left: 120,
            right: 0,
            bottom: 0,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Share my room',
                    style: AppStyle.of(context).b3B.wCChineseBlack,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'My hotel is booked, just looking for partner',
                    style: AppStyle.of(context).b5.wCChineseBlack,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _typeFindingPartnerButton(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  focal: Alignment.centerRight,
                  focalRadius: 0.5,
                  radius: 0.5,
                  colors: [
                    AppColors.findingGradientEnd,
                    AppColors.findingGradientStart,
                    AppColors.findingGradientEnd,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Image(
              image: R.image.img_finding(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            left: 0,
            right: 120,
            bottom: 0,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Finding partner',
                    style: AppStyle.of(context).b3B.wCChineseBlack,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'I’m looking for a travel partner',
                    style: AppStyle.of(context).b5.wCChineseBlack,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
