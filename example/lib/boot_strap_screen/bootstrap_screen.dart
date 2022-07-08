import 'dart:convert';
import 'dart:developer';

import 'package:example/boot_strap_screen/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:yc_app_utils/ui/ui.dart';

class BootstrapScreen extends StatefulWidget {
  const BootstrapScreen({Key? key}) : super(key: key);

  @override
  State<BootstrapScreen> createState() => _BootstrapScreenState();
}

class _BootstrapScreenState extends State<BootstrapScreen> {
  @override
  void initState() {
    getJson();
    super.initState();
  }

  void getJson() {
    List<Map<String, dynamic>> sectionsMap = [];
    BootstrapSkeleton().sections.forEach((element) {
      sectionsMap.add(element.toMap());
    });
    log(jsonEncode(sectionsMap));
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
          children: BootstrapSkeleton()
              .sections
              .map(
                (e) => BootstrapSectionWidget(
                  bootstrapSectionData: e,
                  onPressed: null,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
