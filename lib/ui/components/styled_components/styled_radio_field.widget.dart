import 'package:flutter/material.dart';

import 'package:yc_app_utils/models/styled_component/styled_radio_field.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/v2_styled_text.widget.dart';

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
        for (var i = 0; i < widget.radioFieldData.options.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: widget.radioFieldData.options[i].value,
                groupValue: radioValue,
                onChanged: (String? value) {
                  setState(() {
                    radioValue = value;
                  });
                },
              ),
              Text(
                widget.radioFieldData.options[i].label,
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
