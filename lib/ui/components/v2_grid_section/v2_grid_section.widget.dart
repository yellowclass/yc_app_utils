import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_layer.widget.dart';

class V2GridSectionWidget extends StatelessWidget {
  const V2GridSectionWidget({
    required this.gridDetails,
    required this.onPressed,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final V2GridSectionModel gridDetails;
  final VoidCallback? onPressed;
  final void Function(ClickAction)? innerClickAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
        child: gridDetails.layers != null
            ? Stack(
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
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
