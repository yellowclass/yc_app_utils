import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/ui/ui.dart';

class StyledComponentWidget extends StatelessWidget {
  const StyledComponentWidget({
    required this.styledComponentDetails,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final StyledComponentModel styledComponentDetails;
  final void Function(V2ClickAction)? innerClickAction;

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
              // ADD BUTTON SUBMIT LOGIC
              innerClickAction!.call(
                styledComponentDetails.clickAction!,
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
