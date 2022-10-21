import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/theme/styles.dart';

import '../../../app/app.router.dart';
import 'main_view_model.dart';

class MainView extends ViewModelBuilderWidget<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, MainViewModel viewModel, Widget? child) {
    return Scaffold(
      body: ExtendedNavigator(
        router: MainViewRouter(),
        navigatorKey: StackedService.nestedNavigationKey(MainViewModel.navKey),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.index,
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: AppStyle.of(context).b5M,
        unselectedLabelStyle: AppStyle.of(context).b5M,
        selectedItemColor: AppColors.plumpPurplePrimary,
        unselectedItemColor: AppColors.rhythm,
        onTap: viewModel.onTapItem,
        items: [
          BottomNavigationBarItem(
            icon: Image(image: R.svg.ic_home(width: 35, height: 35)),
            activeIcon:
                Image(image: R.svg.ic_home_active(width: 35, height: 35)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(image: R.svg.ic_map(width: 35, height: 35)),
            activeIcon:
                Image(image: R.svg.ic_map_active(width: 35, height: 35)),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Image(image: R.svg.ic_add(width: 35, height: 35)),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Image(image: R.svg.ic_post(width: 35, height: 35)),
            activeIcon:
                Image(image: R.svg.ic_post_active(width: 35, height: 35)),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Image(image: R.svg.ic_chat(width: 35, height: 35)),
            activeIcon:
                Image(image: R.svg.ic_chat_active(width: 35, height: 35)),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(BuildContext context) => MainViewModel();

  @override
  void onViewModelReady(MainViewModel viewModel) => viewModel.init();
}
