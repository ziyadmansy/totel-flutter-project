import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';
import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/widgets/hotels/hotel_location_item.dart';
import 'package:cheffy/widgets/hotels/searched_hotel_item.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelLocationSelectionView extends StatefulWidget {
  const HotelLocationSelectionView({super.key});

  @override
  State<HotelLocationSelectionView> createState() =>
      _HotelLocationSelectionViewState();
}

class _HotelLocationSelectionViewState
    extends State<HotelLocationSelectionView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search here',
            ),
            onChanged: searchProvider.getHotelsLocation,
          ),
        ),
      ),
      body: ProviderProgressLoader(
        isLoading: searchProvider.busy(searchProvider.filteredHotelLocations),
        child: searchController.text.isEmpty
            ? Center(
                child: Text(
                  'Start searching',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            : searchProvider.filteredHotelLocations.isEmpty
                ? Center(
                    child: Text(
                      'No locations found named: ${searchController.text}',
                    ),
                  )
                : ListView.separated(
                    itemCount: searchProvider.filteredHotelLocations.length,
                    itemBuilder: (context, index) {
                      var result = searchProvider.filteredHotelLocations[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HotelLocationItem(
                          location: result,
                          onPress: () {
                            searchProvider.onSearchedLocationSelection(result);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return Divider();
                    },
                  ),
      ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate<HotelLocationEntity?> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           EasyDebounce.cancel(DebounceTags.hotelsDebouncer);
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         EasyDebounce.cancel(DebounceTags.hotelsDebouncer);
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final searchProvider = context.watch<SearchProvider>();
//     if (query.length < 3) {
//       return Center(
//         child: Text(
//           "Search term must be longer than two letters.",
//         ),
//       );
//     } else {
//       return FutureBuilder<void>(
//         future: searchProvider.getHotelsLocation(query),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Center(
//                   child: CircularProgressIndicator.adaptive(),
//                 ),
//               ],
//             );
//           } else if (snapshot.connectionState == ConnectionState.none) {
//             return Center(
//               child: Text(
//                 "Start Search for locations",
//               ),
//             );
//           } else {
//             var results = searchProvider.filteredHotelLocations;
//             return results.isEmpty
//                 ? Center(
//                     child: Text('No locations found named: $query'),
//                   )
//                 : ListView.builder(
//                     itemCount: results.length,
//                     itemBuilder: (context, index) {
//                       var result = results[index];
//                       return HotelLocationItem(
//                         location: result,
//                         onPress: () {
//                           close(context, result);
//                         },
//                       );
//                     },
//                   );
//           }
//         },
//       );
//     }
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final searchProvider = context.watch<SearchProvider>();
//     // This method is called everytime the search term changes.
//     // If you want to add search suggestions as the user enters their search term, this is the place to do that.
//     return FutureBuilder<void>(
//       future: searchProvider.getHotelsLocation(query),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: CircularProgressIndicator.adaptive(),
//               ),
//             ],
//           );
//         } else if (snapshot.connectionState == ConnectionState.none) {
//           return Center(
//             child: Text(
//               "Start Search for locations",
//             ),
//           );
//         } else {
//           var results = searchProvider.filteredHotelLocations;
//           return results.isEmpty
//               ? Center(
//                   child: Text('No locations found named: $query'),
//                 )
//               : ListView.builder(
//                   itemCount: results.length,
//                   itemBuilder: (context, index) {
//                     var result = results[index];
//                     return HotelLocationItem(
//                       location: result,
//                       onPress: () {
//                         close(context, result);
//                       },
//                     );
//                   },
//                 );
//         }
//       },
//     );
//   }
// }
