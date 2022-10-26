import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';

class DummyView extends StatelessWidget {
  // ignore: constant_identifier_names
  static const TAG = 'DummyView';
  final String name;

  const DummyView({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Log.i(TAG, 'Build : $name');

    return Container(
      key: Key(name),
      child: Center(
        child: Text(name),
      ),
    );
  }
}
