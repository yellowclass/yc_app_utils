import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_row.model.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_column.widget.dart';

class V2GridSectionRowWidget extends StatelessWidget {
  const V2GridSectionRowWidget({
    required this.rowDetails,
    this.innerClickAction,
    this.formData,
    Key? key,
  }) : super(key: key);

  final V2GridSectionRowModel rowDetails;
  final void Function(ClickAction)? innerClickAction;
  final Map<String, dynamic>? formData;

  @override
  Widget build(BuildContext context) {
    return rowDetails.columns != null
        ? Container(
            padding: CommonHelpers.getPaddingFromList(rowDetails.padding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: rowDetails.flexAlignment,
              children: rowDetails.columns!
                  .map(
                    (gridColumn) => V2GridSectionColumnWidget(
                      columnDetails: gridColumn,
                      innerClickAction: innerClickAction,
                    ),
                  )
                  .toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}
