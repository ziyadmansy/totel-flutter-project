import 'package:cheffy/Utils/stacked_nav_keys.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/auth/auth/data/repositories/auth_repo_impl.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:cheffy/modules/widgets/progress/background_progress.dart';
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
      appBar: AppBar(),
      body: BackgroundProgress<RegisterViewModel>(
        child: ExtendedNavigator(
          router: RegisterViewRouter(),
          navigatorKey:
              StackedService.nestedNavigationKey(StackedNavKeys.registerNavKey),
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel(locator.get<AuthRepo>());

  @override
  bool get disposeViewModel => false;
}
