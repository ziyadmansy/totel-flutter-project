import 'package:flutter/material.dart';

class AppTableRow {
  final Decoration? decoration;
  final List<AppTableCell> cells;

  AppTableRow({required this.cells, this.decoration});
}

class AppTableCell {
  final String? text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  AppTableCell(
      {this.text,
      this.textAlign,
      this.style,
      this.maxLines,
      this.textOverflow,
      this.padding,
      this.child})
      : assert(text == null || child == null,
            'only text or child should provided'),
        assert(text != null || child != null,
            'ether text or child should provided');
}
