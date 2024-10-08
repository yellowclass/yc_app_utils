import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_input.model.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_suggestions.model.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapFormSubmissionController {
  BootstrapSubmitFormResponse? Function()? submit;

  void dispose() {
    submit = null;
  }
}

class BootstrapSectionWidget extends StatefulWidget {
  const BootstrapSectionWidget({
    required this.bootstrapSectionData,
    required this.onPressed,
    this.showRippleEffect = false,
    this.innerClickAction,
    this.getAutoCompleteSuggestions,
    this.submitFormController,
    Key? key,
  }) : super(key: key);

  final BootstrapSectionModel bootstrapSectionData;
  final VoidCallback? onPressed;
  final bool showRippleEffect;

  final void Function(
    V2ClickAction clickAction,
    FormResponse? formResponse,
    ClickWidgetState? clickedWidgetState, {
    required String? key,
  })? innerClickAction;

  final Future<AutocompleteSuggestions?> Function(
    AutocompleteInputModel inputData,
  )? getAutoCompleteSuggestions;

  final BootstrapFormSubmissionController? submitFormController;

  @override
  State<BootstrapSectionWidget> createState() => _BootstrapSectionWidgetState();
}

class _BootstrapSectionWidgetState extends State<BootstrapSectionWidget> {
  GlobalKey<FormBuilderState>? _formKey;
  Map<String, dynamic>? _formData;

  final ValueNotifier<bool> formValidationNotifier = ValueNotifier(false);

  BootstrapSubmitFormResponse? submitFormCallback() {
    if (_formKey?.currentState?.validate() ?? false) {
      _formKey?.currentState?.save();
      return BootstrapSubmitFormResponse(
        formResponse: FormResponse(
          formData: _formData!,
          formKey: _formKey!,
        ),
        bootstrapFormKey: widget.bootstrapSectionData.key,
        bootstrapMiscParams: widget.bootstrapSectionData.miscParams,
      );
    }
    return null;
  }

  @override
  void initState() {
    if (widget.bootstrapSectionData.containsForm) {
      _formData = {};
      _formKey = GlobalKey<FormBuilderState>();
      widget.submitFormController?.submit = submitFormCallback;
    } else {
      formValidationNotifier.value = true;
    }
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (widget.bootstrapSectionData.containsForm) {
        formValidationNotifier.value = _formKey?.currentState?.isValid ?? false;
      }
    });
    super.initState();
  }

  bool collectDataFromForm() {
    if (_formKey?.currentState?.validate() ?? false) {
      _formKey?.currentState?.save();
      return true;
    } else {
      // _formData?.clear();
      return false;
    }
  }

  void innerClickActionHandler(
    V2ClickAction cta,
    bool shouldSubmitForm,
    ClickWidgetState? clickedWidgetState, {
    required String? key,
  }) {
    if (shouldSubmitForm) {
      bool isValid = collectDataFromForm();
      if (!isValid) {
        return;
      }
      widget.innerClickAction?.call(
        cta,
        FormResponse(
          formData: _formData!,
          formKey: _formKey!,
        ),
        clickedWidgetState,
        key: key,
      );
      return;
    }
    widget.innerClickAction?.call(
      cta,
      null,
      clickedWidgetState,
      key: key,
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
        getAutoCompleteSuggestions: widget.getAutoCompleteSuggestions,
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
        getAutoCompleteSuggestions: widget.getAutoCompleteSuggestions,
      );
    } else if (widget.bootstrapSectionData.bsData is StyledComponentModel) {
      StyledComponentModel bsWidget =
          widget.bootstrapSectionData.bsData as StyledComponentModel;
      return StyledComponentWidget(
        styledComponent: bsWidget,
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
        width: CommonHelpers.getWidthFromDouble(
          widget.bootstrapSectionData.width,
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
                  width: widget.bootstrapSectionData.borderWidth ?? 1,
                )
              : null,
        ),
        child: widget.bootstrapSectionData.containsForm
            ? FormBuilder(
                key: _formKey,
                onChanged: () {
                  formValidationNotifier.value =
                      _formKey?.currentState?.isValid ?? false;
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildChild(),
                    if (widget.bootstrapSectionData.bottomActionButton != null)
                      BootstrapBottomActionButton(
                        formValidationNotifier: formValidationNotifier,
                        bottomActionButton:
                            widget.bootstrapSectionData.bottomActionButton!,
                        onPressed: (clickWidgetState) {
                          final bottomActionButton =
                              widget.bootstrapSectionData.bottomActionButton!;

                          // if form is not valid, then validate the form and activate the button
                          // this is done as once error text is shown, the isValid flag is not updated
                          // because of a bug in flutter_form_builder which is fixed in the latest version
                          // but we can't upgrade the version because of incompatibility of our dart version
                          // [https://github.com/flutter-form-builder-ecosystem/flutter_form_builder/issues/1348]
                          if (bottomActionButton.key == 'form_submit_button' &&
                              !(_formKey?.currentState?.isValid ?? false)) {
                            formValidationNotifier.value =
                                _formKey?.currentState?.validate() ?? false;
                            return;
                          }

                          innerClickActionHandler(
                            bottomActionButton.v2ClickAction!,
                            bottomActionButton.key == 'form_submit_button',
                            clickWidgetState,
                            key: bottomActionButton.key,
                          );
                        },
                      ),
                  ],
                ),
              )
            : buildChild(),
      ),
    );
  }

  @override
  void dispose() {
    widget.submitFormController?.dispose();
    super.dispose();
  }
}

class BootstrapBottomActionButton extends StatefulWidget {
  final ValueNotifier<bool> formValidationNotifier;
  final GenericButtonV3Model bottomActionButton;
  final Function(ClickWidgetState clickWidgetState) onPressed;

  const BootstrapBottomActionButton({
    required this.formValidationNotifier,
    required this.bottomActionButton,
    required this.onPressed,
    super.key,
  });

  @override
  State<BootstrapBottomActionButton> createState() =>
      _BootstrapBottomActionButtonState();
}

class _BootstrapBottomActionButtonState
    extends State<BootstrapBottomActionButton> implements ClickWidgetState {
  bool _isLoading = false;
  @override
  void setLoading(bool value) {
    if (mounted) {
      setState(() {
        _isLoading = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.m),
      child: ValueListenableBuilder<bool>(
        valueListenable: widget.formValidationNotifier,
        builder: (ctx, isValid, _) {
          final bottomActionButton = widget.bottomActionButton;
          return Container(
            foregroundDecoration:
                !isValid && bottomActionButton.key == 'form_submit_button'
                    ? const BoxDecoration(
                        backgroundBlendMode: BlendMode.saturation,
                        color: AppColors.cGREY_25,
                        borderRadius: BorderRadius.all(
                          Radius.circular(48),
                        ),
                      )
                    : null,
            child: GenericButtonV3Widget(
              buttonDetails: widget.bottomActionButton,
              isLoading: _isLoading,
              onPressed: bottomActionButton.v2ClickAction == null
                  ? null
                  : () => widget.onPressed(this),
            ),
          );
        },
      ),
    );
  }
}
