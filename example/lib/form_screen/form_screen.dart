import 'package:flutter/material.dart';

import 'package:example/form_screen/skeleton.dart';

import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';
import 'package:yc_app_utils/ui/ui.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late V2GridSectionModel _data;

  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};

  @override
  void initState() {
    _data = V2GridSectionModel.fromMap(formSkeleton);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Test Screen'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              V2GridSectionWidget(
                gridDetails: _data,
                onPressed: null,
                innerClickAction: (cta) {
                  print(cta);
                },
              ),
              MaterialButton(
                onPressed: () {
                  // if (!_formKey.currentState!.validate()) {
                  //   return;
                  // }
                  _formKey.currentState!.validate();
                  _formKey.currentState!.save();
                  print('data >>>>> ${_formData}');
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
