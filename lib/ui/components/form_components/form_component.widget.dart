import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class FormComponentWidget extends StatelessWidget {
  const FormComponentWidget({
    required this.formDetails,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final FormComponentModel formDetails;
  final void Function(String, dynamic)? onSaved;

  @override
  Widget build(BuildContext context) {
    switch (formDetails.fcData?.fcType) {
      case FormComponentEnum.FORM_INPUT:
        StyledInputFieldModel inputFieldDetails =
            formDetails.fcData?.data as StyledInputFieldModel;
        return StyledTextFieldWidget(
          textFieldData: inputFieldDetails,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_RADIO:
        StyledRadioFieldModel radioFieldDetails =
            formDetails.fcData?.data as StyledRadioFieldModel;
        return StyledRadioFieldWidget(
          radioFieldData: radioFieldDetails,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_CHECKBOX:
        StyledCheckboxFieldModel checkboxFieldDetails =
            formDetails.fcData?.data as StyledCheckboxFieldModel;
        return StyledCheckboxFieldWidget(
          checkboxFieldData: checkboxFieldDetails,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_SELECT:
        StyledSelectFieldModel selectFieldDetails =
            formDetails.fcData?.data as StyledSelectFieldModel;
        return StyledSelectFieldWidget(
          selectFieldData: selectFieldDetails,
          onSaved: onSaved,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
