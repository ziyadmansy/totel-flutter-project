import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/ui/theme/color.dart';
import 'package:cheffy/ui/widgets/app_bar_action_button.dart';

import '../../theme/styles.dart';
import '../../widgets/dummy_view.dart';
import 'location_change_map_view_model.dart';

class LocationChangeMapView
    extends ViewModelBuilderWidget<LocationChangeMapViewModel> {
  const LocationChangeMapView({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget builder(BuildContext context, LocationChangeMapViewModel viewModel,
      Widget? child) {
    return Material(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: viewModel.onMapCreated,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Select your location',
                      style: AppStyle.of(context).b5M.wCRhythm,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: R.svg
                                        .ic_location(width: 17, height: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Miami - Florida',
                                    style:
                                        AppStyle.of(context).b3B.wCChineseBlack,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '4425 SW 8th St, Coral Gables, FL 33134',
                                style: AppStyle.of(context).b5.wCRhythm,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: viewModel.onPressedChanged,
                          style: OutlinedButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            side: BorderSide(color: AppColors.soap),
                          ),
                          child: Text(
                            'Change',
                            style: AppStyle.of(context).b5M.wCChineseBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: viewModel.onSubmit,
                      child: const Text('Confirm Location'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            left: 8,
            top: 32,
            child: AppBarActionButton(),
          ),
        ],
      ),
    );
  }

  @override
  LocationChangeMapViewModel viewModelBuilder(BuildContext context) =>
      LocationChangeMapViewModel();
}
