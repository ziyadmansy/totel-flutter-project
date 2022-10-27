import 'package:flutter/material.dart';

class SharedWidgets {
  static AppBar buildAppBar({required String title}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
