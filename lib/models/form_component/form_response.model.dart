import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormResponse {
  final Map<String, dynamic> formData;
  final GlobalKey<FormBuilderState> formKey;

  FormResponse({
    required this.formData,
    required this.formKey,
  });
}

class BootstrapSubmitFormResponse {
  final FormResponse formResponse;
  final String bootstrapFormKey;

  BootstrapSubmitFormResponse({
    required this.formResponse,
    required this.bootstrapFormKey,
  });
}
