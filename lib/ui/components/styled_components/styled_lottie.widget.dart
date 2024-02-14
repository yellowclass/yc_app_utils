import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yc_app_utils/models/styled_component/styled_lottie.model.dart';

class StyledLottieWidget extends StatelessWidget {
  final StyledLottieModel styledLottieModel;
  final ValueNotifier<bool> showLottie = ValueNotifier(false);

  StyledLottieWidget({
    required this.styledLottieModel,
    super.key,
  });

  Widget getVisibilityDetectorIfRequired({required Widget child}) {
    if (styledLottieModel.visibilityAnimationFraction != null) {
      return VisibilityDetector(
        onVisibilityChanged: (info) {
          showLottie.value = info.visibleFraction >
              (styledLottieModel.visibilityAnimationFraction ?? 0);
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
                  width: styledLottieModel.width?.toDouble(),
                  height: styledLottieModel.height?.toDouble(),
                  styledLottieModel.url,
                  fit: styledLottieModel.lottieFit,
                  animate: true,
                  repeat: styledLottieModel.repeatAnimation ?? true,
                )
              : Lottie.network(
                  key: UniqueKey(),
                  width: styledLottieModel.width?.toDouble(),
                  height: styledLottieModel.height?.toDouble(),
                  styledLottieModel.url,
                  fit: styledLottieModel.lottieFit,
                  animate: false,
                );
        },
      ),
    );
  }
}
