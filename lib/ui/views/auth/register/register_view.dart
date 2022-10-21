import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.router.dart';

import 'register_view_model.dart';

class RegisterView extends ViewModelBuilderWidget<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(
      BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: ExtendedNavigator(
        router: RegisterViewRouter(),
        navigatorKey: StackedService.nestedNavigationKey(viewModel.navKey),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
