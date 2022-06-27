import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledRadioFieldWidget extends StatefulWidget {
  const StyledRadioFieldWidget({
    required this.radioFieldData,
    Key? key,
  }) : super(key: key);

  final StyledRadioFieldModel radioFieldData;

  @override
  State<StyledRadioFieldWidget> createState() => _StyledRadioFieldWidgetState();
}

class _StyledRadioFieldWidgetState extends State<StyledRadioFieldWidget> {
  String? radioValue;

  @override
  void initState() {
    radioValue = widget.radioFieldData.defaultValue?.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.radioFieldData.label != null)
          V2StyledTextWidget(
            styledText: widget.radioFieldData.label!,
          ),
        FormBuilderRadioGroup(
          name: widget.radioFieldData.name,
          initialValue: radioValue,
          options: widget.radioFieldData.options
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
            validations: widget.radioFieldData.validate,
          ),
          onSaved: (value) {},
        ),
      ],
    );
  }
}
