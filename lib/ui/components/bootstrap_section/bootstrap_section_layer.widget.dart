import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionLayerWidget extends StatelessWidget {
  const BootstrapSectionLayerWidget({
    required this.layerDetails,
    required this.containsForm,
    this.innerClickAction,
    this.formData,
    Key? key,
  }) : super(key: key);

  final BootstrapSectionLayerModel layerDetails;
  final bool containsForm;
  final InnerClickAction? innerClickAction;
  final Map<String, dynamic>? formData;

  @override
  Widget build(BuildContext context) {
    return BootstrapRow(
      children: layerDetails.children
          .map(
            (bootstrapChild) => BootstrapCol(
              sizes: CommonHelpers.getBootstrapSizesFromClasses(
                bootstrapChild.classes,
              ),
              offsets: CommonHelpers.getBootstrapOffsetsFromClasses(
                bootstrapChild.classes,
              ),
              child: BootstrapChildWidget(
                bootstrapChild: bootstrapChild,
                containsForm: containsForm,
                formData: formData,
                innerClickAction: innerClickAction,
              ),
            ),
          )
          .toList(),
    );
  }
}
