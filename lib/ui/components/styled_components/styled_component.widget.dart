import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledComponentWidget extends StatefulWidget {
  const StyledComponentWidget({
    required this.styledComponentDetails,
    required this.containsForm,
    this.innerClickAction,
    this.buttonLoaderColor = AppColors.cGREEN_100,
    Key? key,
  }) : super(key: key);

  final StyledComponentModel styledComponentDetails;
  final bool containsForm;
  final InnerClickAction? innerClickAction;
  final Color buttonLoaderColor;

  @override
  State<StyledComponentWidget> createState() => StyledComponentWidgetState();
}

class StyledComponentWidgetState extends State<StyledComponentWidget>
    with ClickWidgetState {
  bool _isLoading = false;

  @override
  void setLoading(bool value) {
    if (mounted) {
      setState(() {
        _isLoading = value;
      });
    }
  }

  Widget buildComponent() {
    if (_isLoading) {
      return ThreeBounceLoader(
        color: widget.buttonLoaderColor,
        size: 24,
      );
    } else if (widget.styledComponentDetails.scData is V2StyledTextModel) {
      V2StyledTextModel styledTextDetails =
          widget.styledComponentDetails.scData as V2StyledTextModel;
      return V2StyledTextWidget(
        styledText: styledTextDetails,
      );
    } else if (widget.styledComponentDetails.scData is StyledImageModel) {
      StyledImageModel styledImageDetails =
          widget.styledComponentDetails.scData as StyledImageModel;
      return StyledImageWidget(
        styledImageData: styledImageDetails,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return YCClicker(
      onPressed: (widget.styledComponentDetails.clickAction != null &&
              widget.innerClickAction != null &&
              !_isLoading)
          ? () {
              // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
              if (widget.containsForm) {
                // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
                for (var action
                    in widget.styledComponentDetails.clickAction!.actions) {
                  if (action.functionType == V2FunctionTypesEnum.SUBMIT_FORM) {
                    widget.innerClickAction!.call(
                      widget.styledComponentDetails.clickAction!,
                      true,
                      this,
                    );
                  }
                  break;
                }
              } else {
                widget.innerClickAction!.call(
                  widget.styledComponentDetails.clickAction!,
                  false,
                  this,
                );
              }
            }
          : null,
      showRippleEffect:
          widget.styledComponentDetails.clickAction?.showRippleEffect ?? false,
      child: Container(
        padding: CommonHelpers.getPaddingFromList(
          widget.styledComponentDetails.padding,
        ),
        decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
          sectionBackground: widget.styledComponentDetails.background,
        ).copyWith(
          borderRadius: CommonHelpers.getBorderRadiusFromList(
            widget.styledComponentDetails.borderRadius,
          ),
          border: widget.styledComponentDetails.borderColor != null
              ? Border.all(
                  color: CommonHelpers.v2ColorFromHex(
                    widget.styledComponentDetails.borderColor,
                  ),
                )
              : null,
        ),
        child: buildComponent(),
      ),
    );
  }
}
