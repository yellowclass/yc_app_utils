import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class FormComponentWidget extends StatelessWidget {
  const FormComponentWidget({
    required this.formComponentDetails,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final FormComponentModel formComponentDetails;
  final void Function(String, dynamic)? onSaved;

  Widget buildComponent() {
    switch (formComponentDetails.fcData?.fcType) {
      case FormComponentEnum.FORM_INPUT:
        StyledInputFieldModel inputFieldDetails =
            formComponentDetails.fcData?.data as StyledInputFieldModel;
        return StyledTextFieldWidget(
          textFieldData: inputFieldDetails,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_RADIO:
        StyledRadioFieldModel radioFieldDetails =
            formComponentDetails.fcData?.data as StyledRadioFieldModel;
        return StyledRadioFieldWidget(
          radioFieldData: radioFieldDetails,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_CHECKBOX:
        StyledCheckboxFieldModel checkboxFieldDetails =
            formComponentDetails.fcData?.data as StyledCheckboxFieldModel;
        return StyledCheckboxFieldWidget(
          checkboxFieldData: checkboxFieldDetails,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_SELECT:
        StyledSelectFieldModel selectFieldDetails =
            formComponentDetails.fcData?.data as StyledSelectFieldModel;
        return StyledSelectFieldWidget(
          selectFieldData: selectFieldDetails,
          onSaved: onSaved,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonHelpers.getPaddingFromList(
        formComponentDetails.padding,
      ),
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
        sectionBackground: formComponentDetails.background,
      ).copyWith(
        borderRadius: CommonHelpers.getBorderRadiusFromList(
          formComponentDetails.borderRadius,
        ),
        border: Border.all(
          color: CommonHelpers.v2ColorFromHex(
            formComponentDetails.borderColor,
          ),
        ),
      ),
      child: buildComponent(),
    );
  }
}
