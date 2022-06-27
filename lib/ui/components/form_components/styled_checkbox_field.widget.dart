import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledCheckboxFieldWidget extends StatelessWidget {
  const StyledCheckboxFieldWidget({
    required this.checkboxFieldData,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final StyledCheckboxFieldModel checkboxFieldData;
  final void Function(String, dynamic)? onSaved;

  List<String> get initialValues =>
      checkboxFieldData.defaultValue?.map((option) => option.value).toList() ??
      [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (checkboxFieldData.label != null)
          V2StyledTextWidget(
            styledText: checkboxFieldData.label!,
          ),
        FormBuilderCheckboxGroup(
          name: checkboxFieldData.name,
          initialValue: initialValues,
          options: checkboxFieldData.options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option.value,
                ),
              )
              .toList(),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          validator: (values) => CommonHelpers.validateSelectCheckField(
            values: (values != null && values.isNotEmpty)
                ? values
                    .map(
                      (option) => OptionModel(
                        label: option as String,
                        value: option,
                      ),
                    )
                    .toList()
                : [],
            validations: checkboxFieldData.validate,
          ),
          onSaved: (value) {
            onSaved?.call(checkboxFieldData.name, value);
          },
        ),
      ],
    );
  }
}
