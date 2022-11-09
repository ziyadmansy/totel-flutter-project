import 'package:cheffy/modules/search/presentation/search_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SearchHotelsPage extends StatelessWidget {
  const SearchHotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return ListView.builder(
      itemCount: searchProvider.filteredHotels.length,
      itemBuilder: (context, i) {
        return searchProvider.filteredHotels[i];
      },
    );
  }
}
