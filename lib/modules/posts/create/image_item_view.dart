import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cheffy/r.g.dart';
import 'package:cheffy/modules/theme/color.dart';

class ImageItemView extends StatelessWidget {
  final XFile image;
  final VoidCallback onPressedAdd;
  final VoidCallback onPressedRemove;

  const ImageItemView(
      {Key? key,
      required this.image,
      required this.onPressedAdd,
      required this.onPressedRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.file(
                File(image.path),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: onPressedRemove,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0, 2),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Center(
                  child: Image(image: R.svg.ic_close(width: 20, height: 20)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
