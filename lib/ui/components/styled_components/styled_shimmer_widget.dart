import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/styled_component/rich_text.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_shimmer.model.dart';
import 'package:yc_app_utils/ui/components/decorators/button_shimmer_painter.dart';
import 'dart:math';

import 'package:yc_app_utils/ui/components/styled_components/rich_text.widget.dart';
import 'package:yc_app_utils/ui/styleguide/colors.dart';

class StyledShimmerWidget extends StatefulWidget {
  final StyledShimmerModel styledShimmerModel;
  const StyledShimmerWidget({super.key, required this.styledShimmerModel});

  @override
  State<StyledShimmerWidget> createState() => _StyledShimmerWidgetState();
}

class _StyledShimmerWidgetState extends State<StyledShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer;
  StyledShimmerConfigModel? get styledShimmerConfig =>
      widget.styledShimmerModel.styledShimmerConfig;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
          milliseconds: styledShimmerConfig != null
              ? styledShimmerConfig!.duration
              : 1000),
      vsync: this,
    );

    Future.delayed(
        Duration(
          milliseconds: styledShimmerConfig != null
              ? styledShimmerConfig!.initialDelay
              : 2500,
        ), () {
      if (mounted) {
        _controller.forward();
      }

      _timer = Timer.periodic(
          Duration(
            milliseconds: styledShimmerConfig != null
                ? styledShimmerConfig!.repeatDelay
                : 2500,
          ), (timer) {
        if (mounted) {
          _controller.forward(from: 0.0);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
        sectionBackground: widget.styledShimmerModel.background,
      ).copyWith(
        borderRadius: CommonHelpers.getBorderRadiusFromList(
          widget.styledShimmerModel.borderRadius,
        ),
        border: widget.styledShimmerModel.borderColor != null
            ? Border.all(
                color: CommonHelpers.v2ColorFromHex(
                  widget.styledShimmerModel.borderColor,
                ),
              )
            : null,
      ),
      child: ShimmerButtonWidget(
        styledShimmerModel: widget.styledShimmerModel,
        color: styledShimmerConfig != null
            ? CommonHelpers.v2ColorFromHex(styledShimmerConfig!.color)
            : AppColors.cWHITE_100,
        plunkColor: styledShimmerConfig != null
            ? CommonHelpers.v2ColorFromHex(styledShimmerConfig!.color)
            : AppColors.cWHITE_100,
        tiltAngle: styledShimmerConfig != null
            ? styledShimmerConfig!.tiltAngle
            : 3 * pi / 5,
        depth: 0,
        shimmerWidth: 24,
        smallShimmerWidth: 16,
        controller: _controller,
        child: widget.styledShimmerModel.texts != null &&
                widget.styledShimmerModel.primaryTextStyle != null
            ? RichTextWidget(
                richText: RichTextModel(
                  primaryTextStyle: widget.styledShimmerModel.primaryTextStyle,
                  texts: widget.styledShimmerModel.texts,
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
