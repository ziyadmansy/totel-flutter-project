import 'package:flutter/material.dart';
import 'package:cheffy/modules/theme/color.dart';

class AppBarActionButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final bool showElevation;
  final Color? backgroundColor;

  const AppBarActionButton(
      {Key? key,
      this.child,
      this.onPressed,
      this.showElevation = true,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? Theme.of(context).colorScheme.background,
          boxShadow: showElevation
              ? [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 12,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                ]
              : [],
          border: showElevation ? null : Border.all(color: AppColors.soap)),
      child: Center(
        child: child != null
            ? onPressed != null
                ? IconButton(onPressed: onPressed, icon: child!)
                : child
            : IconButton(
                icon: Icon(_getIconData(Theme.of(context).platform)),
                onPressed: onPressed ?? () => Navigator.maybePop(context),
              ),
      ),
    );
  }

  static IconData _getIconData(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios_rounded;
    }
  }
}
