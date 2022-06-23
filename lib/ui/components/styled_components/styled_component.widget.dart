import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/helpers.dart';

import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_checkbox_field.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_radio_field.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_select_field.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_text_area_field.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_text_field.widget.dart';

class StyledComponentWidget extends StatelessWidget {
  const StyledComponentWidget({
    required this.styledComponentDetails,
    Key? key,
  }) : super(key: key);

  final StyledComponentModel styledComponentDetails;

  Widget buildComponent() {
    switch (styledComponentDetails.type) {
      case StyledComponentEnum.FORM_INPUT:
        return StyledTextFieldWidget(
          textFieldData: styledComponentDetails.inputField!,
        );
      case StyledComponentEnum.FORM_TEXTAREA:
        return StyledTextAreaFieldWidget(
          textAreaFieldData: styledComponentDetails.textAreaField!,
        );
      case StyledComponentEnum.FORM_RADIO:
        return StyledRadioFieldWidget(
          radioFieldData: styledComponentDetails.radioField!,
        );
      case StyledComponentEnum.FORM_CHECKBOX:
        return StyledCheckboxFieldWidget(
          checkboxFieldData: styledComponentDetails.checkboxField!,
        );
      case StyledComponentEnum.FORM_SELECT:
        return StyledSelectFieldWidget(
          selectFieldData: styledComponentDetails.selectField!,
        );
      case StyledComponentEnum.BUTTON:
        return Container();
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
