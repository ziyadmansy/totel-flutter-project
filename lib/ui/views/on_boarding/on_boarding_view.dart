import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/widgets/carousel/carousel_view.dart';

import 'on_boarding_item.dart';
import 'on_boarding_view_model.dart';

class OnBoardingView extends ViewModelBuilderWidget<OnBoardingViewModel> {
  const OnBoardingView({super.key});

  @override
  Widget builder(
      BuildContext context, OnBoardingViewModel viewModel, Widget? child) {
    return Scaffold(
      body: CarouselView(
        itemCount: 3,
        onPressedButton: viewModel.onPressedSkip,
        itemBuilder: (context, index) {
          if (index == 0) {
            return OnBoardingItem(
              index: index,
              title: 'Find',
              description:
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              image: R.svg.img_onboarding_1(
                width: 335,
                height: 307,
              ),
              background: R.svg.bg_onboarding(
                width: 428,
                height: 400,
              ),
            );
          } else if (index == 1) {
            return OnBoardingItem(
              index: index,
              title: 'Meet',
              description:
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              image: R.svg.img_onboarding_2(
                width: 335,
                height: 307,
              ),
              background: R.svg.bg_onboarding(
                width: 428,
                height: 400,
              ),
              backgroundTint: AppColors.pastelRedSecondary,
            );
          } else {
            return OnBoardingItem(
              index: index,
              title: 'Live',
              description:
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              padding: 0,
              image: R.svg.img_onboarding_3(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.aspectRatio * 450,
              ),
              background: R.svg.bg_onboarding(
                width: 428,
                height: 400,
              ),
            );
          }
        },
      ),
    );
  }

  @override
  OnBoardingViewModel viewModelBuilder(BuildContext context) =>
      OnBoardingViewModel();
}
