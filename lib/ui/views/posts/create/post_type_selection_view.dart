import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/core/enums/post_type.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';

import '../../../../r.g.dart';

class PostTypeSelectionView extends StatelessWidget {
  final SheetRequest<PostType> request;
  final Function(SheetResponse<PostType>) completer;

  const PostTypeSelectionView(
      {Key? key, required this.completer, required this.request})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () => completer
                  .call(SheetResponse(confirmed: true, data: PostType.booked)),
              child: _typeBookedButton(context),
            ),
            InkWell(
              onTap: () => completer
                  .call(SheetResponse(confirmed: true, data: PostType.finding)),
              child: _typeFindingButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typeBookedButton(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 122,
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
            left: 140,
            right: 0,
            bottom: 0,
            height: 122,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Booked',
                    style: AppStyle.of(context).b3B.wCChineseBlack,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'My hotel is booked just looking for partner',
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

  Widget _typeFindingButton(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 122,
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
            right: 140,
            bottom: 0,
            height: 122,
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
                    'I’m looking for travel partner',
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
