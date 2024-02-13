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
    if (styledLottieModel.startOffset != null) {
      return VisibilityDetector(
        onVisibilityChanged: (info) {
          showLottie.value =
              info.visibleFraction > (styledLottieModel.startOffset ?? 0);
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
          return Lottie.network(
            width: styledLottieModel.width?.toDouble(),
            height: styledLottieModel.height?.toDouble(),
            styledLottieModel.url,
            fit: styledLottieModel.lottieFit,
            animate: styledLottieModel.startOffset == null ? true : val,
          );
        },
      ),
    );
  }
}
