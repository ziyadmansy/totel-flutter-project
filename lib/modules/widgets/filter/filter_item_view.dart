import 'package:flutter/material.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class FilterItemView extends StatelessWidget {
  final ImageProvider icon;
  final String label;

  const FilterItemView({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Image(image: icon, width: 20, height: 20),
      label: Text(
        label,
        style: AppStyle.of(context).b5M.wCRhythm,
      ),
      backgroundColor: Colors.white,
      side: BorderSide(color: AppColors.soap),
    );
    // return Container(
    //   height: 40,
    //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    //   decoration: BoxDecoration(
    //       color: Theme.of(context).colorScheme.surface,
    //       borderRadius: BorderRadius.circular(26),
    //       border: Border.all(color: Theme.of(context).colorScheme.outline)),
    //   child: Row(
    //     children: [
    //       Image(image: icon, width: 20, height: 20),
    //       const SizedBox(width: 4),
    //       Text(
    //         label,
    //         style: AppStyle.of(context).b5M.wCRhythm,
    //       )
    //     ],
    //   ),
    // );
  }
}
