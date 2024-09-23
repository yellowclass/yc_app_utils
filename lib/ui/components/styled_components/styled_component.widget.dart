import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/media_manager_info.model.dart';
import 'package:yc_app_utils/models/styled_component/rich_text.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_circular_progress.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_linear_progress.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_lottie.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_timer.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_circular_progress.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_linear_progress.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_lottie.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_timer.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/rich_text.widget.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledComponentWidget extends StatefulWidget {
  StyledComponentWidget({
    required this.styledComponent,
    required this.containsForm,
    this.innerClickAction,
    this.getPlayer,
    this.onClick,
    Key? key,
  }) : super(key: key) {
    if (styledComponent.scData.runtimeType == StyledVideoModel) {
      assert(
        getPlayer != null,
        "[getPlayer] should not be null when [styledComponentDetails.scData] is type of [StyledVideoModel].",
      );
    }
  }

  final StyledComponentModel styledComponent;
  final bool containsForm;
  final InnerClickAction? innerClickAction;
  final Widget Function(MediaManagerInfo mediainfo)? getPlayer;
  final Future<StyledVideoIconModel> Function(StyledVideoIconModel)? onClick;

  @override
  State<StyledComponentWidget> createState() => StyledComponentWidgetState();
}

class StyledComponentWidgetState extends State<StyledComponentWidget>
    implements ClickWidgetState {
  bool _isLoading = false;

  StyledComponentUnion get _scData {
    return widget.styledComponent.scData;
  }

  @override
  void setLoading(bool value) {
    if (mounted) {
      setState(() {
        _isLoading = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return YCClicker(
      onPressed: (widget.styledComponent.clickAction != null &&
              widget.innerClickAction != null &&
              !_isLoading)
          ? () {
              // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
              // If the section has form true and its click action has SUBMIT_FORM
              // only then the submit form functionality will work rejecting other
              if (widget.containsForm &&
                  widget.styledComponent.clickAction!.actions.any((action) =>
                      action.functionType == V2FunctionTypesEnum.SUBMIT_FORM)) {
                // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
                for (var action
                    in widget.styledComponent.clickAction!.actions) {
                  if (action.functionType == V2FunctionTypesEnum.SUBMIT_FORM) {
                    widget.innerClickAction!.call(
                      widget.styledComponent.clickAction!,
                      true,
                      this,
                      key: widget.styledComponent.uniqueKey,
                    );
                  }
                  break;
                }
              } else {
                widget.innerClickAction!.call(
                  widget.styledComponent.clickAction!,
                  false,
                  this,
                  key: widget.styledComponent.uniqueKey,
                );
              }
            }
          : null,
      showRippleEffect:
          widget.styledComponent.clickAction?.showRippleEffect ?? false,
      child: Container(
        padding: CommonHelpers.getPaddingFromList(
          widget.styledComponent.padding,
        ),
        decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
          sectionBackground: widget.styledComponent.background,
        ).copyWith(
          borderRadius: CommonHelpers.getBorderRadiusFromList(
            widget.styledComponent.borderRadius,
          ),
          border: widget.styledComponent.borderColor != null
              ? Border.all(
                  color: CommonHelpers.v2ColorFromHex(
                    widget.styledComponent.borderColor,
                  ),
                )
              : null,
        ),
        child: buildComponent(),
      ),
    );
  }

  Widget buildComponent() {
    switch (_scData.runtimeType) {
      case V2StyledTextModel:
        final styledTextDetails = _scData as V2StyledTextModel;
        if (_isLoading) {
          return ThreeBounceLoader(
            color: CommonHelpers.v2ColorFromHex(styledTextDetails.textColor),
            size: 24,
          );
        } else {
          return V2StyledTextWidget(styledText: styledTextDetails);
        }
      case StyledImageModel:
        final styledImageDetails = _scData as StyledImageModel;
        return StyledImageWidget(styledImageData: styledImageDetails);
      case StyledVideoModel:
        if (widget.getPlayer != null && widget.onClick != null) {
          final styledVideoDetails = _scData as StyledVideoModel;
          return StyledVideoWidget(
            styledVideoData: styledVideoDetails,
            getVideoPlayer: widget.getPlayer!,
            onClick: (videoIcon) => widget.onClick!(videoIcon),
          );
        }
        return const SizedBox.shrink();
      case StyledLottieModel:
        final styledImageDetails = _scData as StyledLottieModel;
        return StyledLottieWidget(
          styledLottieModel: styledImageDetails,
        );
      case StyledTimerModel:
        final styledTimerData = _scData as StyledTimerModel;
        return StyledTimerWidget(
          styledTimerData: styledTimerData,
        );
      case StyledCircularProgress:
        final styledCircularProgressData = _scData as StyledCircularProgress;
        return StyledCircularProgressWidget(
          styledCircularProgressData: styledCircularProgressData,
        );
      case StyledLinearProgress:
        final styledLinearProgressData = _scData as StyledLinearProgress;
        return StyledLinearProgressWidget(
          styledLinearProgressData: styledLinearProgressData,
        );
      case RichTextModel:
        final richText = _scData as RichTextModel;
        return RichTextWidget(
          richText: richText,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
