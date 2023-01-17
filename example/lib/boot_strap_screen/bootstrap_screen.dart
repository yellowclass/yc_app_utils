import 'dart:convert';
import 'dart:developer';

import 'package:example/boot_strap_screen/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapScreen extends StatefulWidget {
  const BootstrapScreen({Key? key}) : super(key: key);

  @override
  State<BootstrapScreen> createState() => _BootstrapScreenState();
}

class _BootstrapScreenState extends State<BootstrapScreen> {
  @override
  void initState() {
    super.initState();
    for (var section in BootstrapSkeleton().programSections) {
      log(jsonEncode(section.toMap()));
    }
  }

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
          children: [
            ...BootstrapSkeleton()
                .programSections
                .map(
                  (e) => BootstrapSectionWidget(
                    bootstrapSectionData: e,
                    onPressed: null,
                    innerClickAction: (__, _, scK) async {
                      if (_?.formData.isEmpty ?? false) {
                        return;
                      }
                      scK?.setLoading(true);
                      await Future.delayed(const Duration(seconds: 1));
                      scK?.setLoading(false);
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
