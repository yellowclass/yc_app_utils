import 'package:flutter/material.dart';

import 'package:yc_app_utils/models/click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_column.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_component.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section.widget.dart';

class V2GridSectionColumnWidget extends StatelessWidget {
  const V2GridSectionColumnWidget({
    required this.columnDetails,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final V2GridSectionColumnModel columnDetails;
  final void Function(ClickAction)? innerClickAction;

  Widget buildChild() {
    if (columnDetails.gridSection != null) {
      return V2GridSectionWidget(
        gridDetails: columnDetails.gridSection!,
        onPressed:
            (columnDetails.clickAction != null && innerClickAction != null)
                ? () => innerClickAction!.call(
                      columnDetails.clickAction!,
                    )
                : null,
      );
    } else if (columnDetails.data != null) {
      return GestureDetector(
        onTap: (columnDetails.clickAction != null && innerClickAction != null)
            ? () => innerClickAction!.call(
                  columnDetails.clickAction!,
                )
            : null,
        child: StyledComponentWidget(
          styledComponentDetails: columnDetails.data!,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (columnDetails.flexFactor != null) {
      return Expanded(
        flex: columnDetails.flexFactor!,
        child: buildChild(),
      );
    } else {
      return buildChild();
    }
  }
}
