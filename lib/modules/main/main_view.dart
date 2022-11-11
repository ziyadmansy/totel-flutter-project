import 'package:cheffy/Utils/key.dart';
import 'package:cheffy/Utils/stacked_nav_keys.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/profile/profile_provider.dart';
import 'package:cheffy/widgets/app_drawer.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

import '../../../app/app.router.dart';
import 'main_view_model.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    final mainViewModel = context.read<MainViewModel>();
    final profileProvider = context.read<ProfileProvider>();

    mainViewModel.init();
    profileProvider.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    return Scaffold(
      key: mainScreenScaffoldKey,
      extendBody: true,
      drawer: AppDrawer(),
      body: SafeArea(
        bottom: false, // To make the body extend behind bottom bar
        child: ExtendedNavigator(
          router: MainViewRouter(),
          navigatorKey:
              StackedService.nestedNavigationKey(StackedNavKeys.mainNavKey),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: mainViewModel.onAddPostHandler,
          elevation: 8,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        // color: Theme.of(context).primaryColor.withAlpha(0),
        // ↑ use .withAlpha(0) to debug/peek underneath ↑ BottomAppBar
        child: BottomNavigationBar(
          currentIndex: mainViewModel.index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: AppStyle.of(context).b5M,
          unselectedLabelStyle: AppStyle.of(context).b5M,
          selectedItemColor: AppColors.plumpPurplePrimary,
          unselectedItemColor: AppColors.rhythm,
          onTap: mainViewModel.onTapItem,
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
              icon: Image(image: R.svg.ic_post(width: 35, height: 35)),
              activeIcon:
                  Image(image: R.svg.ic_post_active(width: 35, height: 35)),
              label: 'Posts',
            ),
            BottomNavigationBarItem(
              icon: Image(image: R.svg.ic_chat(width: 35, height: 35)),
              activeIcon:
                  Image(image: R.svg.ic_chat_active(width: 35, height: 35)),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }
}
