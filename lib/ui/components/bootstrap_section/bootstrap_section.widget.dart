import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionWidget extends StatefulWidget {
  const BootstrapSectionWidget({
    required this.bootstrapSectionData,
    required this.onPressed,
    this.showRippleEffect = false,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final BootstrapSectionModel bootstrapSectionData;
  final VoidCallback? onPressed;
  final bool showRippleEffect;
  final void Function(
    V2ClickAction clickAction,
    FormResponse? formResponse,
    ClickWidgetState? clickedWidgetState,
  )? innerClickAction;

  @override
  State<BootstrapSectionWidget> createState() => _BootstrapSectionWidgetState();
}

class _BootstrapSectionWidgetState extends State<BootstrapSectionWidget> {
  GlobalKey<FormState>? _formKey;
  Map<String, dynamic>? _formData;

  @override
  void initState() {
    if (widget.bootstrapSectionData.containsForm) {
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

  void innerClickActionHandler(V2ClickAction cta, bool shouldSubmitForm,
      ClickWidgetState? clickedWidgetState) {
    if (shouldSubmitForm) {
      collectDataFromForm();
      widget.innerClickAction?.call(
        cta,
        FormResponse(
          formData: _formData!,
          formKey: _formKey!,
        ),
        clickedWidgetState,
      );
      return;
    }
    widget.innerClickAction?.call(
      cta,
      null,
      clickedWidgetState,
    );
  }

  Widget buildChild() {
    if (widget.bootstrapSectionData.bsData is BootstrapSectionStackModel) {
      BootstrapSectionStackModel bsWidget =
          widget.bootstrapSectionData.bsData as BootstrapSectionStackModel;
      return Stack(
        alignment: bsWidget.stackAlignment,
        children: bsWidget.layers
            .map(
              (bootstrapSectionLayer) => BootstrapSectionLayerWidget(
                layerDetails: bootstrapSectionLayer,
                containsForm: widget.bootstrapSectionData.containsForm,
                innerClickAction: innerClickActionHandler,
                formData: _formData,
              ),
            )
            .toList(),
      );
    } else if (widget.bootstrapSectionData.bsData
        is BootstrapSectionLayerModel) {
      BootstrapSectionLayerModel bsWidget =
          widget.bootstrapSectionData.bsData as BootstrapSectionLayerModel;
      return BootstrapSectionLayerWidget(
        layerDetails: bsWidget,
        containsForm: widget.bootstrapSectionData.containsForm,
        innerClickAction: innerClickActionHandler,
        formData: _formData,
      );
    } else if (widget.bootstrapSectionData.bsData
        is BootstrapSectionChildModel) {
      BootstrapSectionChildModel bsWidget =
          widget.bootstrapSectionData.bsData as BootstrapSectionChildModel;
      return BootstrapSectionLayerWidget(
        layerDetails: BootstrapSectionLayerModel(
          children: [bsWidget],
        ),
        containsForm: widget.bootstrapSectionData.containsForm,
        innerClickAction: innerClickActionHandler,
        formData: _formData,
      );
    } else if (widget.bootstrapSectionData.bsData is StyledComponentModel) {
      StyledComponentModel bsWidget =
          widget.bootstrapSectionData.bsData as StyledComponentModel;
      return StyledComponentWidget(
        styledComponentDetails: bsWidget,
        containsForm: widget.bootstrapSectionData.containsForm,
        innerClickAction: innerClickActionHandler,
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
        height: CommonHelpers.getHeightFromDouble(
          widget.bootstrapSectionData.height,
        ),
        padding: CommonHelpers.getPaddingFromList(
          widget.bootstrapSectionData.padding,
        ),
        decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
          sectionBackground: widget.bootstrapSectionData.background,
        ).copyWith(
          borderRadius: CommonHelpers.getBorderRadiusFromList(
            widget.bootstrapSectionData.borderRadius,
          ),
          border: widget.bootstrapSectionData.borderColor != null
              ? Border.all(
                  color: CommonHelpers.v2ColorFromHex(
                    widget.bootstrapSectionData.borderColor,
                  ),
                )
              : null,
        ),
        child: widget.bootstrapSectionData.containsForm
            ? Form(
                key: _formKey,
                child: buildChild(),
              )
            : buildChild(),
      ),
    );
  }
}
