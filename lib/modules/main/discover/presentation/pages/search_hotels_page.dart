import 'package:cheffy/Utils/theme/styles.dart';
import 'package:cheffy/modules/main/discover/presentation/pages/search_hotel_listing_view.dart';
import 'package:cheffy/modules/main/discover/presentation/search_provider.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/widgets/post_listing_item/post_listing_item_view.dart';
import 'package:cheffy/widgets/shared_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:provider/provider.dart';

class SearchHotelsPage extends StatefulWidget {
  final String searchKeyWord;

  const SearchHotelsPage({super.key, required this.searchKeyWord});

  @override
  State<SearchHotelsPage> createState() => _SearchHotelsPageState();
}

class _SearchHotelsPageState extends State<SearchHotelsPage> {
  @override
  void initState() {
    super.initState();
    final searchProvider = context.read<SearchProvider>();
    Future.delayed(Duration.zero, () {
      searchProvider.getSearchHotels(widget.searchKeyWord);
    });
  }

  @override
  Widget build(BuildContext context) {
    Log.e("Search Word", " : " + widget.searchKeyWord);
    final searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: SharedWidgets.buildHomeAppBar(title: 'Discover Hotels'),
      body: !searchProvider.hotelEntity.isListNotEmptyOrNull
          ? Center(
              child: Text('No Data found',
                  style: AppStyle.of(context).b3B.wCChineseBlack))
          : ListView.builder(
              itemCount: searchProvider.hotelEntity?.length,
              itemBuilder: (context, i) {
                return SearchHotelItemVerticalLayoutView(
                    post: searchProvider.hotelEntity![i],
                    onPress: () {
                      //postsProvider.onTapPost(postItem);
                    });
              },
            ),
    );
  }
}
