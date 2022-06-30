import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledTextFieldWidget extends StatelessWidget {
  const StyledTextFieldWidget({
    required this.textFieldData,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final StyledInputFieldModel textFieldData;
  final void Function(String, String?)? onSaved;

  TextInputType? getKeyboardType(InputFieldEnum? fieldType) {
    switch (fieldType) {
      case InputFieldEnum.EMAIL:
        return TextInputType.emailAddress;
      case InputFieldEnum.STRING:
        return TextInputType.text;
      case InputFieldEnum.NUMBER:
        return TextInputType.number;
      case InputFieldEnum.MOBILE:
        return TextInputType.phone;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textFieldData.label != null)
          V2StyledTextWidget(
            styledText: textFieldData.label!,
          ),
        TextFormField(
          initialValue: textFieldData.inputDefaultValue,
          enabled: !textFieldData.isDisabled,
          textAlignVertical: TextAlignVertical.bottom,
          inputFormatters: [
            if (textFieldData.inputFieldType == InputFieldEnum.NUMBER)
              FilteringTextInputFormatter.digitsOnly
          ],
          maxLines: textFieldData.maxLines,
          keyboardType: getKeyboardType(textFieldData.inputFieldType),
          obscureText: textFieldData.inputFieldType == InputFieldEnum.PASSWORD,
          decoration: InputDecoration(
            hintText: textFieldData.placeholder,
            hintStyle: const TextStyle(
              color: AppColors.cBODY_TEXT_75,
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s,
              vertical: AppSpacing.m,
            ),
          ),
          style: const TextStyle(
            color: AppColors.cBODY_TEXT,
            fontSize: 16,
          ),
          validator: (value) => CommonHelpers.validateTextField(
            value: value!,
            validations: textFieldData.validation,
          ),
          onSaved: (value) {
            onSaved?.call(
              textFieldData.name,
              value,
            );
          },
        ),
      ],
    );
  }
}
