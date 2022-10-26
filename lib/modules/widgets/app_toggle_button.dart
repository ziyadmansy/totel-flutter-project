import 'package:flutter/material.dart';
import 'package:cheffy/modules/theme/color.dart';
import 'package:cheffy/modules/theme/styles.dart';

class AppToggleButton extends StatelessWidget {
  final ImageProvider icon;
  final String name;
  final bool isSelected;
  final VoidCallback callback;

  const AppToggleButton(
      {Key? key,
      required this.icon,
      required this.name,
      required this.isSelected,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.plumpPurplePrimary : AppColors.soap,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Image(
              image: icon,
              color: isSelected
                  ? AppColors.plumpPurplePrimary
                  : AppColors.chineseBlack,
            ),
            const SizedBox(width: 8),
            Text(name,
                style: isSelected
                    ? AppStyle.of(context).b3.wCPlumpPurplePrimary
                    : AppStyle.of(context).b3.wCChineseBlack),
          ],
        ),
      ),
    );
  }
}
