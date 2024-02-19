import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yc_app_utils/models/styled_component/styled_lottie.model.dart';

class StyledLottieWidget extends StatefulWidget {
  final StyledLottieModel styledLottieModel;

  const StyledLottieWidget({
    required this.styledLottieModel,
    super.key,
  });

  @override
  State<StyledLottieWidget> createState() => _StyledLottieWidgetState();
}

class _StyledLottieWidgetState extends State<StyledLottieWidget> {
  late final ValueNotifier<bool> showLottie;

  @override
  void initState() {
    super.initState();
    showLottie = ValueNotifier<bool>(
      widget.styledLottieModel.animateOnPercentage == null,
    );
  }

  Widget getVisibilityDetectorIfRequired({required Widget child}) {
    if (widget.styledLottieModel.animateOnPercentage != null) {
      return VisibilityDetector(
        onVisibilityChanged: (info) {
          showLottie.value = info.visibleFraction >
              (widget.styledLottieModel.animateOnPercentage! / 100);
        },
        key: UniqueKey(),
        child: child,
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return getVisibilityDetectorIfRequired(
      child: ValueListenableBuilder<bool>(
        valueListenable: showLottie,
        builder: (context, val, _) {
          return val
              ? Lottie.network(
                  key: UniqueKey(),
                  width: widget.styledLottieModel.width?.toDouble(),
                  height: widget.styledLottieModel.height?.toDouble(),
                  widget.styledLottieModel.url,
                  fit: widget.styledLottieModel.lottieFit,
                  animate: true,
                  repeat: (widget.styledLottieModel.animateAfter ?? 0) >= 0,
                )
              : Lottie.network(
                  key: UniqueKey(),
                  width: widget.styledLottieModel.width?.toDouble(),
                  height: widget.styledLottieModel.height?.toDouble(),
                  widget.styledLottieModel.url,
                  fit: widget.styledLottieModel.lottieFit,
                  animate: false,
                );
        },
      ),
    );
  }
}
