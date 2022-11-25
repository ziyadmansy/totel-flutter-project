import 'package:cheffy/Utils/key.dart';
import 'package:cheffy/Utils/stacked_nav_keys.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/main/profile/profile_provider.dart';
import 'package:cheffy/modules/posts/create/post_type_selection_view.dart';
import 'package:cheffy/widgets/app_drawer.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    Future.delayed(Duration.zero, () {
      mainViewModel.init();

      // To get drawer profile and name
      profileProvider.getProfile();
    });
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
          onPressed: () {
            final NavigationService _navigationService = locator.get();

            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
              builder: (context) {
                return PostTypeSelectionView(
                  onShareRoomPressed: () {
                    _navigationService.navigateToCreatePostShareRoomView();
                  },
                  onFindingPartnerPressed: () {
                    _navigationService
                        .navigateTo(Routes.createPostFindingPartnerView);
                  },
                );
              },
            );
          },
          elevation: 8,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomAppBar(
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
                icon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.rhythm,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.plumpPurplePrimary,
                ),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.map,
                  color: AppColors.rhythm,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.solidMap,
                  color: AppColors.plumpPurplePrimary,
                ),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.image,
                  color: AppColors.rhythm,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.solidImage,
                  color: AppColors.plumpPurplePrimary,
                ),
                label: 'Posts',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.user,
                  color: AppColors.rhythm,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: AppColors.plumpPurplePrimary,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
