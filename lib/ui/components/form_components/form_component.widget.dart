import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/form_component/form_component.model.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_checkbox_field.widget.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_radio_field.widget.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_select_field.widget.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_text_area_field.widget.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_text_field.widget.dart';

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
    switch (formDetails.fcType) {
      case FormComponentEnum.FORM_INPUT:
        return StyledTextFieldWidget(
          textFieldData: formDetails.inputField!,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_TEXTAREA:
        return StyledTextAreaFieldWidget(
          textAreaFieldData: formDetails.textAreaField!,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_RADIO:
        return StyledRadioFieldWidget(
          radioFieldData: formDetails.radioField!,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_CHECKBOX:
        return StyledCheckboxFieldWidget(
          checkboxFieldData: formDetails.checkboxField!,
          onSaved: onSaved,
        );
      case FormComponentEnum.FORM_SELECT:
        return StyledSelectFieldWidget(
          selectFieldData: formDetails.selectField!,
          onSaved: onSaved,
        );
    }
  }
}
