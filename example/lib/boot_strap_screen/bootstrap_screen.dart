import 'package:example/boot_strap_screen/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:yc_app_utils/ui/ui.dart';

class BootstrapScreen extends StatelessWidget {
  const BootstrapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(
      gutterSize: 0,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootstrap Test Screen'),
      ),
      body: Column(
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
    );
  }
}
