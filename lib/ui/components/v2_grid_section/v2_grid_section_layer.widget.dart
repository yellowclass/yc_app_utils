import 'package:flutter/material.dart';

import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_layer.model.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_row.widget.dart';

class V2GridSectionLayerWidget extends StatelessWidget {
  const V2GridSectionLayerWidget({
    required this.layerDetails,
    required this.containsForm,
    this.innerClickAction,
    this.formKey,
    this.formData,
    Key? key,
  }) : super(key: key);

  final V2GridSectionLayerModel layerDetails;
  final bool containsForm;
  final void Function(V2ClickAction, Map<String, dynamic>?)? innerClickAction;
  final GlobalKey<FormState>? formKey;
  final Map<String, dynamic>? formData;

  @override
  Widget build(BuildContext context) {
    return layerDetails.rows != null
        ? Column(
            children: layerDetails.rows!
                .map(
                  (gridRow) => gridRow.columns != null
                      ? V2GridSectionRowWidget(
                          rowDetails: gridRow,
                          containsForm: containsForm,
                          innerClickAction: innerClickAction,
                          formKey: formKey,
                          formData: formData,
                        )
                      : const SizedBox.shrink(),
                )
                .toList(),
          )
        : const SizedBox.shrink();
  }
}
