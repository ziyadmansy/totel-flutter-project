import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';
import 'package:cheffy/modules/widgets/stream_widget.dart';

import 'location_change_view_model.dart';

class LocationChangeView
    extends ViewModelBuilderWidget<LocationChangeViewModel> {
  const LocationChangeView({super.key});

  @override
  Widget builder(
      BuildContext context, LocationChangeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set your location'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Find Location',
                  filled: true,
                  fillColor: AppColors.soap,
                  hintStyle: AppStyle.of(context).b4.wCCrayola,
                  suffixIcon: Image(
                    image: R.svg.ic_search(width: 24, height: 24),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                leading: Image(
                  alignment: Alignment.centerLeft,
                  image: R.svg.ic_current_location(width: 34, height: 34),
                ),
                title: Text(
                  'Set Current location',
                  style: AppStyle.of(context).b4M.wCPlumpPurplePrimary,
                ),
                subtitle: Text(
                  'Using GPS',
                  style: AppStyle.of(context).b5.wCCrayola,
                ),
                onTap: viewModel.onTapSetCurrentLocation,
              ),
              Divider(
                thickness: 3,
                color: AppColors.soap,
              ),
              const SizedBox(height: 12),
              Text(
                'Recently Search',
                style: AppStyle.of(context).b5.wCRhythm,
              ),
              Expanded(
                child: StreamWidget<List<LocationEntity>>(
                  stream: viewModel.locations,
                  done: (data) => ListView.separated(
                    itemCount: data?.length ?? 0,
                    separatorBuilder: (context, index) => Divider(
                      color: AppColors.soap,
                    ),
                    itemBuilder: (context, index) => ListTile(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        data![index].name,
                        style: AppStyle.of(context).b4M.wCChineseBlack,
                      ),
                      subtitle: Text(
                        'api does not return',
                        style: AppStyle.of(context).b5.wCRhythm,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () =>
                          viewModel.onTapLocationItem(index, data[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LocationChangeViewModel viewModelBuilder(BuildContext context) =>
      LocationChangeViewModel();

  @override
  void onViewModelReady(LocationChangeViewModel viewModel) => viewModel.init();
}
