import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BackgroundProgress<T> extends ViewModelWidget<T> {
  final Widget child;

  const BackgroundProgress({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, T viewModel) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      child: Stack(
        children: [
          child,
          if ((viewModel as BaseViewModel).isBusy)
            AnimatedOpacity(
              opacity: viewModel.isBusy ? 1 : 0,
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
