import 'dart:convert';
import 'dart:developer';

import 'package:example/boot_strap_screen/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:yc_app_utils/models/bootstrap_section/bootstrap_section.model.dart';
import 'package:yc_app_utils/ui/ui.dart';

class BootstrapScreen extends StatefulWidget {
  const BootstrapScreen({Key? key}) : super(key: key);

  @override
  State<BootstrapScreen> createState() => _BootstrapScreenState();
}

class _BootstrapScreenState extends State<BootstrapScreen> {
  @override
  void initState() {
    super.initState();
    for (var section in BootstrapSkeleton().claimSections) {
      log(jsonEncode(section.toMap()));
    }
  }

  List<BootstrapSectionModel> _sections = [];

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(
      gutterSize: 0,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootstrap Test Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: BootstrapSkeleton()
              .claimSections
              // children: _sections
              .map(
                (e) => BootstrapSectionWidget(
                  bootstrapSectionData: e,
                  onPressed: null,
                  innerClickAction: (__, _, scK) async {
                    scK?.setLoading(true);
                    print(_?.formData);
                    await Future.delayed(const Duration(seconds: 1));
                    scK?.setLoading(false);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
