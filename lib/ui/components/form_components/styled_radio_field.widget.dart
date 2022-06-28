import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledRadioFieldWidget extends StatelessWidget {
  const StyledRadioFieldWidget({
    required this.radioFieldData,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final StyledRadioFieldModel radioFieldData;
  final void Function(String, String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (radioFieldData.label != null)
          V2StyledTextWidget(
            styledText: radioFieldData.label!,
          ),
        FormBuilderRadioGroup(
          name: radioFieldData.name,
          initialValue: radioFieldData.defaultValue?.value,
          options: radioFieldData.options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option.value,
                ),
              )
              .toList(),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          validator: (value) => CommonHelpers.validateRadioField(
            value: value != null
                ? OptionModel(
                    label: value as String,
                    value: value,
                  )
                : null,
            validations: radioFieldData.validation,
          ),
          onSaved: (String? value) {
            onSaved?.call(radioFieldData.name, value);
          },
        ),
      ],
    );
  }
}
