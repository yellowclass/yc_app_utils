import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';
import 'package:yc_app_utils/ui/components/generic_button/yc_clicker.widget.dart';
import 'package:yc_app_utils/ui/components/styled_components/styled_component.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_column.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_layer.widget.dart';
import 'package:yc_app_utils/ui/components/v2_grid_section/v2_grid_section_row.widget.dart';

class V2GridSectionWidget extends StatefulWidget {
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
  final void Function(
          V2ClickAction clickAction, Map<String, dynamic>? formData)?
      innerClickAction;

  @override
  State<V2GridSectionWidget> createState() => _V2GridSectionWidgetState();
}

class _V2GridSectionWidgetState extends State<V2GridSectionWidget> {
  GlobalKey<FormState>? _formKey;
  Map<String, dynamic>? _formData;

  @override
  void initState() {
    if (widget.gridDetails.containsForm) {
      _formData = {};
      _formKey = GlobalKey<FormState>();
    }
    super.initState();
  }

  void collectDataFromForm() {
    if (_formKey?.currentState?.validate() ?? false) {
      _formKey?.currentState?.save();
    } else {
      _formData?.clear();
    }
  }

  void innerClickActionHandler(V2ClickAction cta, bool shouldSubmitForm) {
    if (shouldSubmitForm) {
      collectDataFromForm();
      widget.innerClickAction?.call(
        cta,
        _formData,
      );
      return;
    }
    widget.innerClickAction?.call(
      cta,
      null,
    );
  }

  Widget buildChild() {
    if (widget.gridDetails.layers != null) {
      return Stack(
        children: widget.gridDetails.layers!
            .map(
              (gridLayer) => gridLayer.rows != null
                  ? V2GridSectionLayerWidget(
                      layerDetails: gridLayer,
                      containsForm: widget.gridDetails.containsForm,
                      innerClickAction: innerClickActionHandler,
                      formData: _formData,
                    )
                  : const SizedBox.shrink(),
            )
            .toList(),
      );
    } else if (widget.gridDetails.rows != null) {
      return Column(
        children: widget.gridDetails.rows!
            .map(
              (gridRow) => gridRow.columns != null
                  ? V2GridSectionRowWidget(
                      rowDetails: gridRow,
                      containsForm: widget.gridDetails.containsForm,
                      innerClickAction: innerClickActionHandler,
                      formData: _formData,
                    )
                  : const SizedBox.shrink(),
            )
            .toList(),
      );
    } else if (widget.gridDetails.columns != null) {
      return Row(
        children: widget.gridDetails.columns!
            .map(
              (gridColumn) => V2GridSectionColumnWidget(
                columnDetails: gridColumn,
                containsForm: widget.gridDetails.containsForm,
                innerClickAction: innerClickActionHandler,
                formData: _formData,
              ),
            )
            .toList(),
      );
    } else if (widget.gridDetails.styledComponent != null) {
      return YCClicker(
        onPressed: (widget.gridDetails.styledComponent!.clickAction != null &&
                widget.innerClickAction != null)
            ? () => widget.innerClickAction!.call(
                  widget.gridDetails.styledComponent!.clickAction!,
                  null,
                )
            : null,
        showRippleEffect:
            widget.gridDetails.styledComponent?.clickAction?.showRippleEffect ??
                false,
        child: StyledComponentWidget(
          styledComponentDetails: widget.gridDetails.styledComponent!,
          containsForm: widget.gridDetails.containsForm,
          innerClickAction: innerClickActionHandler,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return YCClicker(
      onPressed: widget.onPressed,
      showRippleEffect: widget.showRippleEffect,
      child: Container(
        padding: CommonHelpers.getPaddingFromList(
          widget.gridDetails.padding,
        ),
        decoration: BoxDecoration(
          color: CommonHelpers.v2ColorFromHex(
            widget.gridDetails.backgroundColor,
          ),
          borderRadius: CommonHelpers.getBorderRadiusFromList(
            widget.gridDetails.borderRadius,
          ),
          border: Border.all(
            color: CommonHelpers.v2ColorFromHex(
              widget.gridDetails.borderColor,
            ),
          ),
        ),
        child: widget.gridDetails.containsForm
            ? Form(
                key: _formKey,
                child: buildChild(),
              )
            : buildChild(),
      ),
    );
  }
}
