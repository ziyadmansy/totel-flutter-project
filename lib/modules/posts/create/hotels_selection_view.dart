import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/posts/create/create_post_view_model.dart';
import 'package:cheffy/modules/widgets/progress/provider_progress_loader.dart';
import 'package:cheffy/widgets/hotels/searched_hotel_item.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HotelsSelectionView extends StatefulWidget {
  const HotelsSelectionView({super.key});

  @override
  State<HotelsSelectionView> createState() => _HotelsSelectionViewState();
}

class _HotelsSelectionViewState extends State<HotelsSelectionView> {
  final searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final createPostsViewModel = context.watch<CreatePostViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search here',
            ),
            onChanged: (query) async {
              await createPostsViewModel.getFilteredHotels(query);
            },
          ),
        ),
      ),
      body: ProviderProgressLoader(
        isLoading:
            createPostsViewModel.busy(createPostsViewModel.filteredHotels),
        child: searchController.text.isEmpty
            ? Center(
                child: Text('Start searching'),
              )
            : createPostsViewModel.filteredHotels.isEmpty
                ? Center(
                    child:
                        Text('No hotels found named: ${searchController.text}'),
                  )
                : ListView.separated(
                    itemCount: createPostsViewModel.filteredHotels.length,
                    itemBuilder: (context, index) {
                      var result = createPostsViewModel.filteredHotels[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchedHotelItem(
                          hotel: result,
                          onPress: () {
                            createPostsViewModel
                                .onSearchedHotelSelection(result);
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

class CustomSearchDelegate extends SearchDelegate<HotelEntity?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          EasyDebounce.cancel(DebounceTags.hotelsDebouncer);
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        EasyDebounce.cancel(DebounceTags.hotelsDebouncer);
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final createPostsViewModel = context.watch<CreatePostViewModel>();
    if (query.length < 3) {
      return Center(
        child: Text(
          "Search term must be longer than two letters.",
        ),
      );
    } else {
      return ListView.builder(
        itemCount: createPostsViewModel.filteredHotels.length,
        itemBuilder: (context, index) {
          var item = createPostsViewModel.filteredHotels[index];
          return SearchedHotelItem(hotel: item);
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final createPostsViewModel = context.watch<CreatePostViewModel>();
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return FutureBuilder<void>(
      future: createPostsViewModel.getFilteredHotels(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: Text(
              "Start Search for hotels",
            ),
          );
        } else {
          var results = createPostsViewModel.filteredHotels;
          return results.isEmpty
              ? Center(
                  child: Text('No hotels found named: $query'),
                )
              : ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    var result = results[index];
                    return SearchedHotelItem(
                      hotel: result,
                      onPress: () {
                        close(context, result);
                      },
                    );
                  },
                );
        }
      },
    );
  }
}
