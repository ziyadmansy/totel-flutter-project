import 'package:flutter/material.dart';

class StreamWidget<T> extends StatelessWidget {
  final Stream<T> stream;

  /// If null, will use default Centered Circular Progress Indicator
  final Widget Function()? waiting;
  final Widget Function(Object? error)? error;
  final Widget Function(T? data) done;
  final bool showError;

  const StreamWidget(
      {Key? key,
      required this.stream,
      this.waiting,
      this.error,
      this.showError = true,
      required this.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return !showError
              ? Container()
              : error != null
                  ? error!(snapshot.error)
                  : Container(
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
