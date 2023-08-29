import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yc_app_utils/models/styled_component/styled_lottie.model.dart';

class StyledLottieWidget extends StatelessWidget {
  final StyledLottieModel styledLottieModel;
  const StyledLottieWidget({required this.styledLottieModel, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: styledLottieModel.width?.toDouble(),
      height: styledLottieModel.height?.toDouble(),
      child: Lottie.network(styledLottieModel.url),
    );
  }
}
