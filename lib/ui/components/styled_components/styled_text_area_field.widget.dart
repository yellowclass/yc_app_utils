import 'package:flutter/material.dart';

import 'package:yc_app_utils/ui/components/styled_components/v2_styled_text.widget.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledTextAreaFieldWidget extends StatelessWidget {
  const StyledTextAreaFieldWidget({
    required this.textAreaFieldData,
    Key? key,
  }) : super(key: key);

  final StyledTextAreaFieldModel textAreaFieldData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textAreaFieldData.label != null)
          V2StyledTextWidget(
            styledText: textAreaFieldData.label!,
          ),
        TextFormField(
          initialValue: textAreaFieldData.defaultValue,
          enabled: !textAreaFieldData.isDisabled,
          textAlignVertical: TextAlignVertical.bottom,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: textAreaFieldData.placeholder,
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
            validations: textAreaFieldData.validate,
          ),
          onSaved: (value) {},
        ),
      ],
    );
  }
}
