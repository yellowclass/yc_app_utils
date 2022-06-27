import 'package:flutter/material.dart';

import 'package:yc_app_utils/ui/ui.dart';

class YCClicker extends StatelessWidget {
  YCClicker({
    required this.child,
    required this.onPressed,
    this.showRippleEffect = false,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool showRippleEffect;

  final ValueNotifier<double> _elevationNotifier = ValueNotifier<double>(0);

  bool get isOnPressedAvailable => onPressed != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: isOnPressedAvailable
          ? (_) {
              _elevationNotifier.value = 0;
              onPressed?.call();
            }
          : null,
      onTapDown: isOnPressedAvailable
          ? (_) {
              _elevationNotifier.value = 4;
            }
          : null,
      onTapCancel: isOnPressedAvailable
          ? () {
              _elevationNotifier.value = 0;
            }
          : null,
      child: ValueListenableBuilder<double>(
        valueListenable: _elevationNotifier,
        builder: (context, elevation, child) {
          return AnimatedContainer(
            duration: const Duration(
              milliseconds: 100,
            ),
            child: Material(
              elevation: showRippleEffect ? elevation : 0,
              borderRadius: BorderRadius.circular(
                AppRadius.s,
              ),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
