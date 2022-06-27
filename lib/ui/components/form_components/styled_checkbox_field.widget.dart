import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class StyledCheckboxFieldWidget extends StatefulWidget {
  const StyledCheckboxFieldWidget({
    required this.checkboxFieldData,
    Key? key,
  }) : super(key: key);

  final StyledCheckboxFieldModel checkboxFieldData;

  @override
  State<StyledCheckboxFieldWidget> createState() =>
      _StyledCheckboxFieldWidgetState();
}

class _StyledCheckboxFieldWidgetState extends State<StyledCheckboxFieldWidget> {
  List<String> initialValues = [];

  @override
  void initState() {
    initialValues = widget.checkboxFieldData.defaultValue
            ?.map((option) => option.value)
            .toList() ??
        [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.checkboxFieldData.label != null)
          V2StyledTextWidget(
            styledText: widget.checkboxFieldData.label!,
          ),
        FormBuilderCheckboxGroup(
          name: widget.checkboxFieldData.name,
          initialValue: initialValues,
          options: widget.checkboxFieldData.options
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
            validations: widget.checkboxFieldData.validate,
          ),
          onSaved: (value) {},
        ),
      ],
    );
  }
}
