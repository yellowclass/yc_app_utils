import 'package:flutter/material.dart';

import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_column.model.dart';
import 'package:yc_app_utils/ui/components/form_components/form_component.widget.dart';
import 'package:yc_app_utils/ui/components/generic_button/yc_clicker.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_component.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section.widget.dart';

class V2GridSectionColumnWidget extends StatelessWidget {
  const V2GridSectionColumnWidget({
    required this.columnDetails,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final V2GridSectionColumnModel columnDetails;
  final void Function(V2ClickAction)? innerClickAction;

  Widget buildChild() {
    if (columnDetails.gridSection != null) {
      return V2GridSectionWidget(
        gridDetails: columnDetails.gridSection!,
        onPressed: (columnDetails.gridSection!.clickAction != null &&
                innerClickAction != null)
            ? () => innerClickAction!.call(
                  columnDetails.gridSection!.clickAction!,
                )
            : null,
      );
    } else if (columnDetails.styledComponent != null) {
      return StyledComponentWidget(
        styledComponentDetails: columnDetails.styledComponent!,
        innerClickAction: innerClickAction,
      );
    } else if (columnDetails.formComponent != null) {
      return FormComponentWidget(
        formDetails: columnDetails.formComponent!,
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
        child: Column(
          mainAxisAlignment: columnDetails.mainAxisAlignment,
          crossAxisAlignment: columnDetails.crossAxisAlignment,
          children: [
            buildChild(),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: columnDetails.mainAxisAlignment,
        crossAxisAlignment: columnDetails.crossAxisAlignment,
        children: [
          buildChild(),
        ],
      );
    }
  }
}
