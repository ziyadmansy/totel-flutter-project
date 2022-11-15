import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchHotelsPage extends StatelessWidget {
  const SearchHotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(title: 'Discover Hotels'),
      // body: ListView.builder(
      //   itemCount: searchProvider.filteredHotels.length,
      //   itemBuilder: (context, i) {
      //     return searchProvider.filteredHotels[i];
      //   },
      // ),
    );
  }
}