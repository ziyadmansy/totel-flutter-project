import 'package:cheffy/modules/splash/presentation/splash_view_model.dart';
import 'package:cheffy/r.g.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends ViewModelBuilderWidget<SplashViewModel> {
  const SplashView({super.key});

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.navigateToApp();
  }

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: R.image.img_logo()),
            const SizedBox(width: 16),
            Image(image: R.image.img_logo_name()),
          ],
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();
}
