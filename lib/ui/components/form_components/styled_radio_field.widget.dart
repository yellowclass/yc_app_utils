import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledRadioFieldWidget extends StatefulWidget {
  const StyledRadioFieldWidget({
    required this.radioFieldData,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final StyledRadioFieldModel radioFieldData;
  final void Function(String, String?)? onSaved;

  @override
  State<StyledRadioFieldWidget> createState() => _StyledRadioFieldWidgetState();
}

class _StyledRadioFieldWidgetState extends State<StyledRadioFieldWidget> {
  StyledInputFieldModel? inputField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.radioFieldData.label != null)
          Row(
            children: [
              V2StyledTextWidget(
                styledText: widget.radioFieldData.label!,
              ),
              if (widget.radioFieldData.validation?.isRequired?.value == true)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: AppColors.cRed_100,
                  ),
                ),
            ],
          ),
        FormBuilderRadioGroup(
          name: widget.radioFieldData.name,
          initialValue: widget.radioFieldData.radioDefaultValue?.value,
          orientation: widget.radioFieldData.radioButtonArrangement ??
              OptionsOrientation.wrap,
          options: widget.radioFieldData.options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option.value,
                ),
              )
              .toList(),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          validator: (value) => CommonHelpers.validateRadioField(
            value: value != null
                ? OptionModel(
                    label: value as String,
                    value: value,
                  )
                : null,
            validations: widget.radioFieldData.validation,
          ),
          onSaved: (String? value) {
            widget.onSaved?.call(widget.radioFieldData.name, value);
          },
          onChanged: (String? value) => setState(() => inputField = widget
              .radioFieldData.options
              .firstWhere((option) => option.value == value)
              .inputField),
        ),
        if (inputField != null)
          StyledTextFieldWidget(
            textFieldData: inputField!,
            onSaved: widget.onSaved,
          ),
      ],
    );
  }
}
