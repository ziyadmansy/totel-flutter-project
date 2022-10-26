import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool bounce;
  final Axis direction;
  final Alignment textAlign;

  const AnimatedText(this.text,
      {super.key,
      this.style,
      this.bounce = false,
      this.direction = Axis.vertical,
      this.textAlign = Alignment.centerLeft});

  @override
  Widget build(BuildContext context) {
    var x = direction == Axis.horizontal ? 0.5 : 0.0;
    var y = direction == Axis.vertical ? 0.5 : 0.0;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        if (bounce) {
          return SlideTransition(
            position: Tween<Offset>(
                    begin: Offset(bounce ? x : 0.0, bounce ? y : 0.0),
                    end: const Offset(0.0, 0.0))
                .animate(animation),
            child: FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            ),
          );
        } else {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
            child: child,
          );
        }
      },
      child: Text(
        text,
        key: ValueKey<String>(text),
        style: style,
      ),
    );
  }
}
