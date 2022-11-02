import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

import 'carousel_view_model.dart';

class CarouselView extends ViewModelBuilderWidget<CarouselViewModel> {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final VoidCallback? onPressedButton;
  final double bottomMargin;

  const CarouselView(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.onPressedButton,
      this.bottomMargin = 0});

  @override
  Widget builder(
      BuildContext context, CarouselViewModel viewModel, Widget? child) {
    final bottom =
        onPressedButton != null ? 0 + bottomMargin : 8 + bottomMargin;
    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          itemCount: itemCount,
          onPageChanged: viewModel.onPageChange,
          itemBuilder: itemBuilder,
        ),
        Positioned(
          left: 16,
          right: 8,
          bottom: bottom,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 8,
                  child: ListView.separated(
                    itemCount: itemCount,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: viewModel.index == index ? 48 : 24,
                        decoration: BoxDecoration(
                          color: viewModel.index == index
                              ? AppColors.magnolia
                              : AppColors.soap,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  ),
                ),
                if (onPressedButton != null)
                  TextButton(
                    onPressed: onPressedButton,
                    child: Text(
                      'Skip',
                      style: AppStyle.of(context).b4.wCSoap,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  CarouselViewModel viewModelBuilder(BuildContext context) =>
      CarouselViewModel();
}
