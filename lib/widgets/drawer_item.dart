import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final IconData icon;
  final VoidCallback onPress;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.onPress,
    this.titleStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: titleStyle,
      ),
      leading: FaIcon(
        icon,
        color: Colors.grey,
      ),
      onTap: onPress,
    );
  }
}
