import 'package:flutter/material.dart';

import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_column.widget.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class V2GridSectionRowWidget extends StatelessWidget {
  const V2GridSectionRowWidget({
    required this.rowDetails,
    required this.containsForm,
    this.innerClickAction,
    this.formData,
    Key? key,
  }) : super(key: key);

  final V2GridSectionRowModel rowDetails;
  final bool containsForm;
  final InnerClickAction? innerClickAction;
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
                      formData: formData,
                    ),
                  )
                  .toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}
