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
    getJson();
    super.initState();
  }

  List<BootstrapSectionModel> _sections = [];
  void getJson() {
    setState(() {
      _sections = (BootstrapSkeleton().formSkeleton['sections'] as List)
          .map(
            (e) => BootstrapSectionModel.fromMap(e),
          )
          .toList();
    });
    // List<Map<String, dynamic>> sectionsMap = [];
    // BootstrapSkeleton().sections.forEach((element) {
    //   sectionsMap.add(element.toMap());
    // });
    // log(jsonEncode(sectionsMap));
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
              // children: _sections
              .map(
                (e) => BootstrapSectionWidget(
                  bootstrapSectionData: e,
                  onPressed: null,
                  // innerClickAction: (__, _, scK) async {
                  //   scK?.setLoading(true);
                  //   await Future.delayed(Duration(seconds: 5));
                  //   scK?.setLoading(false);
                  // },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
