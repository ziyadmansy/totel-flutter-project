import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reactive_image_picker/image_file.dart';

class ReactiveImagePickerImageView extends StatelessWidget {
  final ImageFile image;

  const ReactiveImagePickerImageView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final imageFile = image.image;
    if (imageFile != null) {
      return Image.file(imageFile, fit: BoxFit.cover);
    }

    final localImage = image.localImage;
    if (localImage != null) {
      final file = File(localImage);
      return Image.memory(file.readAsBytesSync(), fit: BoxFit.cover);
    }

    final imageUrl = image.imageUrl;
    if (imageUrl != null) {
      return Image.network(imageUrl);
    }

    return Container();
  }
}
