import 'package:cheffy/Utils/stacked_nav_keys.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:cheffy/modules/search/presentation/search_provider.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cheffy/app/app.router.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: SharedWidgets.buildAppBar(
          title: 'Search',
        ),
        body: ProviderProgressLoader(
          isLoading: searchProvider.isLoading,
          child: ExtendedNavigator(
            router: SearchRouter(),
            navigatorKey:
                StackedService.nestedNavigationKey(StackedNavKeys.searchNavKey),
          ),
        ),
      ),
    );
  }
}
