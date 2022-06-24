import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';
import 'package:yc_app_utils/ui/components/form_components/form_component.widget.dart';
import 'package:yc_app_utils/ui/components/generic_button/yc_clicker.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_component.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_column.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_layer.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_row.widget.dart';

class V2GridSectionWidget extends StatelessWidget {
  const V2GridSectionWidget({
    required this.gridDetails,
    required this.onPressed,
    this.showRippleEffect = false,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final V2GridSectionModel gridDetails;
  final VoidCallback? onPressed;
  final bool showRippleEffect;
  final void Function(V2ClickAction)? innerClickAction;

  Widget buildChild() {
    if (gridDetails.layers != null) {
      return Stack(
        children: gridDetails.layers!
            .map(
              (gridLayer) => gridLayer.rows != null
                  ? V2GridSectionLayerWidget(
                      layerDetails: gridLayer,
                      innerClickAction: innerClickAction,
                    )
                  : const SizedBox.shrink(),
            )
            .toList(),
      );
    } else if (gridDetails.rows != null) {
      return Column(
        children: gridDetails.rows!
            .map(
              (gridRow) => gridRow.columns != null
                  ? V2GridSectionRowWidget(
                      rowDetails: gridRow,
                      innerClickAction: innerClickAction,
                    )
                  : const SizedBox.shrink(),
            )
            .toList(),
      );
    } else if (gridDetails.columns != null) {
      return Row(
        children: gridDetails.columns!
            .map(
              (gridColumn) => V2GridSectionColumnWidget(
                columnDetails: gridColumn,
                innerClickAction: innerClickAction,
              ),
            )
            .toList(),
      );
    } else if (gridDetails.styledComponent != null) {
      return YCClicker(
        onPressed: (gridDetails.styledComponent!.clickAction != null &&
                innerClickAction != null)
            ? () => innerClickAction!.call(
                  gridDetails.styledComponent!.clickAction!,
                )
            : null,
        showRippleEffect:
            gridDetails.styledComponent?.clickAction?.showRippleEffect ?? false,
        child: StyledComponentWidget(
          styledComponentDetails: gridDetails.styledComponent!,
          innerClickAction: innerClickAction,
        ),
      );
    } else if (gridDetails.formComponent != null) {
      return FormComponentWidget(
        formDetails: gridDetails.formComponent!,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return YCClicker(
      onPressed: onPressed,
      showRippleEffect: showRippleEffect,
      child: Container(
        padding: CommonHelpers.getPaddingFromList(
          gridDetails.padding,
        ),
        decoration: BoxDecoration(
          color: CommonHelpers.v2ColorFromHex(
            gridDetails.backgroundColor,
          ),
          borderRadius: CommonHelpers.getBorderRadiusFromList(
            gridDetails.borderRadius,
          ),
          border: Border.all(
            color: CommonHelpers.v2ColorFromHex(
              gridDetails.borderColor,
            ),
          ),
        ),
        child: buildChild(),
      ),
    );
  }
}
