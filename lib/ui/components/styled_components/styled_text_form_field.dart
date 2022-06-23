import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_app_utils/ui/components/styled_components/v2_styled_text.widget.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({
    required this.formFieldData,
    this.formData,
    Key? key,
  }) : super(key: key);

  final StyledInputFieldModel formFieldData;
  final Map<String, dynamic>? formData;

  TextInputType? getKeyboardType(InputFieldEnum? fieldType) {
    switch (fieldType) {
      case InputFieldEnum.EMAIL:
        return TextInputType.emailAddress;
      case InputFieldEnum.STRING:
        return TextInputType.text;
      case InputFieldEnum.NUMBER:
        return TextInputType.number;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (formFieldData.label != null)
          V2StyledTextWidget(
            styledText: formFieldData.label!,
          ),
        TextFormField(
          initialValue: formFieldData.defaultValue,
          enabled: !formFieldData.isDisabled,
          textAlignVertical: TextAlignVertical.bottom,
          inputFormatters: [
            if (formFieldData.type == InputFieldEnum.NUMBER)
              FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: getKeyboardType(formFieldData.type),
          obscureText: formFieldData.type == InputFieldEnum.PASSWORD,
          decoration: InputDecoration(
            hintText: formFieldData.placeholder,
            hintStyle: const TextStyle(
              color: AppColors.cBODY_TEXT_75,
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s,
              vertical: AppSpacing.xs,
            ),
          ),
          style: const TextStyle(
            color: AppColors.cBODY_TEXT,
            fontSize: 16,
          ),
          validator: (value) => CommonHelpers.validateFormField(
            value: value!,
            validations: formFieldData.validate,
          ),
          onSaved: (value) {
            formData?[formFieldData.name] = value;
          },
        ),
      ],
    );
  }
}
