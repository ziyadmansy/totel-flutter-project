import 'package:flutter/material.dart';

class FutureWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function()? waiting;
  final Widget Function(T? data) done;

  const FutureWidget(
      {Key? key, required this.future, this.waiting, required this.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${snapshot.error}',
              textAlign: TextAlign.center,
            ),
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return waiting == null
                ? const Center(child: CircularProgressIndicator())
                : waiting!();
          case ConnectionState.active:
          case ConnectionState.done:
            return done(snapshot.data);
        }
      },
    );
  }
}
