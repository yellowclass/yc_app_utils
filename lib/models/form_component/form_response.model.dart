import 'package:flutter/material.dart';

class FormResponse {
  final Map<String, dynamic> formData;
  final GlobalKey<FormState> formKey;

  FormResponse({
    required this.formData,
    required this.formKey,
  });
}
