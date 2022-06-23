import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({
    required this.formFieldData,
    Key? key,
  }) : super(key: key);

  final StyledInputFieldModel formFieldData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(),
      ],
    );
  }
}
