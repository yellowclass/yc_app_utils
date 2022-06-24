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
      // case StyledComponentEnum.FORM_INPUT:
      //   return StyledTextFieldWidget(
      //     textFieldData: styledComponentDetails.inputField!,
      //   );
      // case StyledComponentEnum.FORM_TEXTAREA:
      //   return StyledTextAreaFieldWidget(
      //     textAreaFieldData: styledComponentDetails.textAreaField!,
      //   );
      // case StyledComponentEnum.FORM_RADIO:
      //   return StyledRadioFieldWidget(
      //     radioFieldData: styledComponentDetails.radioField!,
      //   );
      // case StyledComponentEnum.FORM_CHECKBOX:
      //   return StyledCheckboxFieldWidget(
      //     checkboxFieldData: styledComponentDetails.checkboxField!,
      //   );
      // case StyledComponentEnum.FORM_SELECT:
      //   return StyledSelectFieldWidget(
      //     selectFieldData: styledComponentDetails.selectField!,
      //   );
      // case StyledComponentEnum.BUTTON:
      //   return GenericButtonV3Widget(
      //     buttonDetails: styledComponentDetails.buttonDetails!,
      //     onPressed:
      //         (styledComponentDetails.buttonDetails!.clickAction != null &&
      //                 innerClickAction != null)
      //             ? () => innerClickAction!.call(
      //                   styledComponentDetails.buttonDetails!.clickAction!,
      //                 )
      //             : null,
      //   );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
