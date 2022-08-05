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
    if (formComponentDetails.fcData is StyledInputFieldModel) {
      StyledInputFieldModel inputFieldDetails =
          formComponentDetails.fcData as StyledInputFieldModel;
      return StyledTextFieldWidget(
        textFieldData: inputFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledDateTimeFieldModel) {
      StyledDateTimeFieldModel dateTimeFieldDetails =
          formComponentDetails.fcData as StyledDateTimeFieldModel;
      return StyledDateTimeFieldWidget(
        dateTimeFieldData: dateTimeFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledRadioFieldModel) {
      StyledRadioFieldModel radioFieldDetails =
          formComponentDetails.fcData as StyledRadioFieldModel;
      return StyledRadioFieldWidget(
        radioFieldData: radioFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledCheckboxFieldModel) {
      StyledCheckboxFieldModel checkboxFieldDetails =
          formComponentDetails.fcData as StyledCheckboxFieldModel;
      return StyledCheckboxFieldWidget(
        checkboxFieldData: checkboxFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledSelectFieldModel) {
      StyledSelectFieldModel selectFieldDetails =
          formComponentDetails.fcData as StyledSelectFieldModel;
      return StyledSelectFieldWidget(
        selectFieldData: selectFieldDetails,
        onSaved: onSaved,
      );
    } else {
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
        border: formComponentDetails.borderColor != null
            ? Border.all(
                color: CommonHelpers.v2ColorFromHex(
                  formComponentDetails.borderColor,
                ),
              )
            : null,
      ),
      child: buildComponent(),
    );
  }
}
