import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:cheffy/modules/theme/styles.dart';

class AppFormField extends StatelessWidget {
  final String? label;
  final Widget field;

  const AppFormField({Key? key, this.label, required this.field})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label.isNotNullOrEmpty) ...[
          Text(label!, style: AppStyle.of(context).b4.wCRhythm),
          const SizedBox(height: 8),
        ],
        field,
      ],
    );
  }
}
