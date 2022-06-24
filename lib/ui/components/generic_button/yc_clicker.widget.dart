import 'package:flutter/material.dart';

class YCClicker extends StatefulWidget {
  const YCClicker({
    required this.child,
    required this.onPressed,
    this.showRippleEffect = false,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool showRippleEffect;

  @override
  State<YCClicker> createState() => _YCClickerState();
}

class _YCClickerState extends State<YCClicker> {
  double _elevation = 0;

  bool get isOnPressedAvailable => widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: isOnPressedAvailable
          ? (_) {
              setState(() {
                _elevation = 0;
              });
              widget.onPressed?.call();
            }
          : null,
      onTapDown: isOnPressedAvailable
          ? (_) {
              setState(() {
                _elevation = 4;
              });
            }
          : null,
      onTapCancel: isOnPressedAvailable
          ? () {
              setState(() {
                _elevation = 0;
              });
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 100,
        ),
        child: Material(
          elevation: widget.showRippleEffect ? _elevation : 0,
          child: widget.child,
        ),
      ),
    );
  }
}
