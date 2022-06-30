import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledComponentWidget extends StatelessWidget {
  const StyledComponentWidget({
    required this.styledComponentDetails,
    required this.containsForm,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final StyledComponentModel styledComponentDetails;
  final bool containsForm;
  final InnerClickAction? innerClickAction;

  Widget buildComponent() {
    switch (styledComponentDetails.scData?.scType) {
      case StyledComponentEnum.TEXT:
        V2StyledTextModel styledTextDetails =
            styledComponentDetails.scData?.data as V2StyledTextModel;
        return V2StyledTextWidget(
          styledText: styledTextDetails,
        );
      case StyledComponentEnum.IMAGE:
        StyledImageModel styledImageDetails =
            styledComponentDetails.scData?.data as StyledImageModel;
        return StyledImageWidget(
          styledImageData: styledImageDetails,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return YCClicker(
      onPressed: (styledComponentDetails.clickAction != null &&
              innerClickAction != null)
          ? () {
              // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
              if (containsForm) {
                // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
                for (var action
                    in styledComponentDetails.clickAction!.actions) {
                  if (action.functionType == V2FunctionTypesEnum.SUBMIT_FORM) {
                    innerClickAction!.call(
                      styledComponentDetails.clickAction!,
                      true,
                    );
                  }
                  break;
                }
              } else {
                innerClickAction!.call(
                  styledComponentDetails.clickAction!,
                  false,
                );
              }
            }
          : null,
      showRippleEffect:
          styledComponentDetails.clickAction?.showRippleEffect ?? false,
      child: Container(
        padding: CommonHelpers.getPaddingFromList(
          styledComponentDetails.padding,
        ),
        decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
          sectionBackground: styledComponentDetails.background,
        ).copyWith(
          borderRadius: CommonHelpers.getBorderRadiusFromList(
            styledComponentDetails.borderRadius,
          ),
          border: Border.all(
            color: CommonHelpers.v2ColorFromHex(
              styledComponentDetails.borderColor,
            ),
          ),
        ),
        child: buildComponent(),
      ),
    );
  }
}
