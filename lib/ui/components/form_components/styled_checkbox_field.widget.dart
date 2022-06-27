import 'package:flutter/material.dart';

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
  List<String> selectedValues = [];

  @override
  void initState() {
    selectedValues = widget.checkboxFieldData.defaultValue
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
        for (var i = 0; i < widget.checkboxFieldData.options.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: selectedValues
                    .contains(widget.checkboxFieldData.options[i].value),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedValues
                          .add(widget.checkboxFieldData.options[i].value);
                    } else {
                      selectedValues
                          .remove(widget.checkboxFieldData.options[i].value);
                    }
                  });
                },
              ),
              Text(
                widget.checkboxFieldData.options[i].label,
              ),
            ],
          ),
      ],
    );
  }
}

// class _RadioGrp extends FormField<String?> {
//   _RadioGrp({
//     required super.builder,
//     required super.validator,
//   });
// }
