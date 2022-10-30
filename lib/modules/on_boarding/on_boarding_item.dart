import 'dart:math' as math;

import 'package:cheffy/r.g.dart';
import 'package:flutter/material.dart';
import 'package:cheffy/modules/theme/styles.dart';

class OnBoardingItem extends StatelessWidget {
  final int index;
  final ImageProvider background;
  final Color? backgroundTint;
  final ImageProvider image;
  final String title;
  final String description;
  final double padding;

  const OnBoardingItem(
      {Key? key,
      required this.index,
      required this.background,
      required this.image,
      required this.title,
      required this.description,
      this.backgroundTint,
      this.padding = 52})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: R.image.img_logo()),
                const SizedBox(width: 16),
                Image(image: R.image.img_logo_name()),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Image(
              image: image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (index == 1) ...[
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image(
                    image: background,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    color: backgroundTint,
                  ),
                )
              ] else ...[
                Image(
                  image: background,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  color: backgroundTint,
                )
              ],
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppStyle.of(context).b2B.wCMagnolia,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: AppStyle.of(context).b4M.wCSoap,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
