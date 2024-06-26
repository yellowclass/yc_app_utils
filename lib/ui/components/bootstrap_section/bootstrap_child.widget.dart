import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_input.model.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_suggestions.model.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapChildWidget extends StatefulWidget {
  const BootstrapChildWidget({
    required this.bootstrapChild,
    required this.containsForm,
    this.innerClickAction,
    this.formData,
    this.buttonLoaderColor = AppColors.cGREEN_100,
    this.getAutoCompleteSuggestions,
    Key? key,
  }) : super(key: key);

  final BootstrapSectionChildModel bootstrapChild;
  final bool containsForm;
  final InnerClickAction? innerClickAction;
  final Map<String, dynamic>? formData;
  final Color buttonLoaderColor;
  final Future<AutocompleteSuggestions?> Function(
      AutocompleteInputModel inputData)? getAutoCompleteSuggestions;

  @override
  State<BootstrapChildWidget> createState() => BootstrapChildWidgetState();
}

class BootstrapChildWidgetState extends State<BootstrapChildWidget>
    with ClickWidgetState {
  bool _isLoading = false;

  @override
  void setLoading(bool value) {
    if (mounted) {
      setState(() {
        _isLoading = value;
      });
    }
  }

  Widget buildChild() {
    if (widget.bootstrapChild.bcData is BootstrapSectionModel) {
      BootstrapSectionModel child =
          widget.bootstrapChild.bcData as BootstrapSectionModel;
      if (_isLoading) {
        return ThreeBounceLoader(
          color: CommonHelpers.v2ColorFromHex(
            child.background?.backgroundColor,
          ),
          size: 24,
        );
      } else {
        return BootstrapSectionWidget(
          bootstrapSectionData: child,
          showRippleEffect: child.clickAction?.showRippleEffect ?? false,
          onPressed: (child.clickAction != null &&
                  widget.innerClickAction != null &&
                  !_isLoading)
              ? () {
                  // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
                  // If the section has form true and its click action has SUBMIT_FORM
                  // only then the submit form functionality will work rejecting other
                  if (widget.containsForm &&
                      child.clickAction!.actions.any((action) =>
                          action.functionType ==
                          V2FunctionTypesEnum.SUBMIT_FORM)) {
                    // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
                    for (var action in child.clickAction!.actions) {
                      if (action.functionType ==
                          V2FunctionTypesEnum.SUBMIT_FORM) {
                        widget.innerClickAction!.call(
                          child.clickAction!,
                          true,
                          this,
                          key: child.key,
                        );
                      }
                      break;
                    }
                  } else {
                    widget.innerClickAction!.call(
                      child.clickAction!,
                      false,
                      this,
                      key: child.key,
                    );
                  }
                }
              : null,
          innerClickAction: (
            clickAction,
            _,
            clickedWidgetState, {
            String? key,
          }) {
            // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
            // If the section has form true and its click action has SUBMIT_FORM
            // only then the submit form functionality will work rejecting other
            if (widget.containsForm &&
                child.clickAction!.actions.any((action) =>
                    action.functionType == V2FunctionTypesEnum.SUBMIT_FORM)) {
              // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
              for (var action in clickAction.actions) {
                if (action.functionType == V2FunctionTypesEnum.SUBMIT_FORM) {
                  widget.innerClickAction!.call(
                    clickAction,
                    true,
                    clickedWidgetState,
                    key: key,
                  );
                }
                break;
              }
            } else {
              widget.innerClickAction!.call(
                clickAction,
                false,
                clickedWidgetState,
                key: key,
              );
            }
          },
        );
      }
    } else if (widget.bootstrapChild.bcData is StyledComponentModel) {
      StyledComponentModel child =
          widget.bootstrapChild.bcData as StyledComponentModel;
      return StyledComponentWidget(
        styledComponent: child,
        containsForm: widget.containsForm,
        innerClickAction: widget.innerClickAction,
      );
    } else if (widget.bootstrapChild.bcData is FormComponentModel) {
      FormComponentModel widgetData =
          widget.bootstrapChild.bcData as FormComponentModel;
      return FormComponentWidget(
        formComponentDetails: widgetData,
        onSaved: (key, value) {
          if (widgetData.fcData is StyledSelectFieldModel &&
              (widgetData.fcData as StyledSelectFieldModel).selectType ==
                  SelectType.SINGLE) {
            // For dropdown field of type single
            // assign first element of the list if not empty
            // otherwise null
            widget.formData?[key] =
                (value is List && (value).isNotEmpty) ? value[0] : null;
          } else {
            // Assign value directly
            widget.formData?[key] = value;
          }
        },
        getAutoCompleteSuggestions: widget.getAutoCompleteSuggestions,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CommonHelpers.getHeightFromDouble(
        widget.bootstrapChild.height,
      ),
      alignment: widget.bootstrapChild.boxAlignment,
      padding: CommonHelpers.getPaddingFromList(
        widget.bootstrapChild.padding,
      ),
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
        sectionBackground: widget.bootstrapChild.background,
      ).copyWith(
        border: widget.bootstrapChild.borderColor != null
            ? Border.all(
                color: CommonHelpers.v2ColorFromHex(
                  widget.bootstrapChild.borderColor,
                ),
                width: widget.bootstrapChild.borderWidth ?? 1,
              )
            : null,
        borderRadius: CommonHelpers.getBorderRadiusFromList(
          widget.bootstrapChild.borderRadius,
        ),
      ),
      child: buildChild(),
    );
  }
}
