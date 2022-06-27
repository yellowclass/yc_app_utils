import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_row.model.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_column.widget.dart';

class V2GridSectionRowWidget extends StatelessWidget {
  const V2GridSectionRowWidget({
    required this.rowDetails,
    required this.containsForm,
    this.innerClickAction,
    this.formKey,
    this.formData,
    Key? key,
  }) : super(key: key);

  final V2GridSectionRowModel rowDetails;
  final bool containsForm;
  final void Function(V2ClickAction, Map<String, dynamic>?)? innerClickAction;
  final GlobalKey<FormState>? formKey;
  final Map<String, dynamic>? formData;

  @override
  Widget build(BuildContext context) {
    return rowDetails.columns != null
        ? Container(
            padding: CommonHelpers.getPaddingFromList(rowDetails.padding),
            child: Row(
              mainAxisAlignment: rowDetails.mainAxisAlignment,
              crossAxisAlignment: rowDetails.crossAxisAlignment,
              children: rowDetails.columns!
                  .map(
                    (gridColumn) => V2GridSectionColumnWidget(
                      columnDetails: gridColumn,
                      containsForm: containsForm,
                      innerClickAction: innerClickAction,
                      formKey: formKey,
                      formData: formData,
                    ),
                  )
                  .toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}
