import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledComponentWidget extends StatelessWidget {
  const StyledComponentWidget({
    required this.styledComponentDetails,
    required this.containsForm,
    this.innerClickAction,
    this.formKey,
    this.formData,
    Key? key,
  }) : super(key: key);

  final StyledComponentModel styledComponentDetails;
  final bool containsForm;
  final void Function(V2ClickAction, Map<String, dynamic>?)? innerClickAction;
  final GlobalKey<FormState>? formKey;
  final Map<String, dynamic>? formData;

  Widget buildComponent() {
    switch (styledComponentDetails.type) {
      case StyledComponentEnum.TEXT:
        return V2StyledTextWidget(
          styledText: styledComponentDetails.textDetails!,
        );
      case StyledComponentEnum.IMAGE:
        return StyledImageWidget(
          styledImageData: styledComponentDetails.imageDetails!,
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
                    if (formKey!.currentState!.validate()) {
                      formKey!.currentState!.save();
                    } else {
                      formData!.clear();
                    }
                  }
                  break;
                }
              }
              innerClickAction!.call(
                styledComponentDetails.clickAction!,
                formData,
              );
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
