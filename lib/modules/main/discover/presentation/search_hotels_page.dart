import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/widgets/hotels/searched_hotel_item.dart';
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
      body: searchProvider.filteredHotels.isEmpty
          ? Center(
              child: Text(
                'No hotels available by this name, please try something else',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.separated(
              itemCount: searchProvider.filteredHotels.length,
              itemBuilder: (context, i) {
                return SearchedHotelItem(
                  hotel: searchProvider.filteredHotels[i],
                  onPress: () {
                    searchProvider
                        .onSearchedHotelPress(searchProvider.filteredHotels[i]);
                  },
                );
              },
              separatorBuilder: (context, i) {
                return Divider();
              },
            ),
    );
  }
}
