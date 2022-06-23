import 'package:flutter/material.dart';

import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_text_form_field.dart';

class StyledComponentWidget extends StatelessWidget {
  const StyledComponentWidget({
    required this.styledComponentDetails,
    Key? key,
  }) : super(key: key);

  final StyledComponentModel styledComponentDetails;

  @override
  Widget build(BuildContext context) {
    switch (styledComponentDetails.type) {
      case StyledComponentEnum.FORM_INPUT:
        return StyledTextFormField(
          formFieldData: styledComponentDetails.inputField!,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
