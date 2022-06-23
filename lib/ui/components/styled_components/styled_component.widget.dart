import 'package:flutter/material.dart';

import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_text_form_field.dart';

class StyledComponentWidget extends StatelessWidget {
  const StyledComponentWidget({
    required this.styledComponentDetails,
    this.formData,
    Key? key,
  }) : super(key: key);

  final StyledComponentModel styledComponentDetails;
  final Map<String, dynamic>? formData;

  @override
  Widget build(BuildContext context) {
    switch (styledComponentDetails.type) {
      case StyledComponentEnum.FORM_INPUT:
        return StyledTextFormField(
          formFieldData: styledComponentDetails.inputField!,
          formData: formData,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
