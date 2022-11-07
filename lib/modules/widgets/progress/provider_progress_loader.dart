import 'package:flutter/material.dart';
import 'dart:ui';

class ProviderProgressLoader extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ProviderProgressLoader({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      child: Stack(
        children: [
          child,
          if (isLoading)
            AnimatedOpacity(
              opacity: isLoading ? 1 : 0,
              duration: const Duration(milliseconds: 2000),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).colorScheme.secondary),
                      strokeWidth: 3.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
