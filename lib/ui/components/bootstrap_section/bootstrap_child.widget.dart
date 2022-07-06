import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapChildWidget extends StatelessWidget {
  const BootstrapChildWidget({
    required this.bootstrapChild,
    required this.containsForm,
    this.innerClickAction,
    this.formData,
    Key? key,
  }) : super(key: key);

  final BootstrapChildModel bootstrapChild;
  final bool containsForm;
  final InnerClickAction? innerClickAction;
  final Map<String, dynamic>? formData;

  Widget buildChild() {
    if (bootstrapChild.bcData is BootstrapSectionModel) {
      BootstrapSectionModel child =
          bootstrapChild.bcData as BootstrapSectionModel;
      return BootstrapSectionWidget(
        bootstrapSectionData: child,
        onPressed: (child.clickAction != null && innerClickAction != null)
            ? () {
                // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
                if (containsForm) {
                  // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
                  for (var action in child.clickAction!.actions) {
                    if (action.functionType ==
                        V2FunctionTypesEnum.SUBMIT_FORM) {
                      innerClickAction!.call(
                        child.clickAction!,
                        true,
                      );
                    }
                    break;
                  }
                } else {
                  innerClickAction!.call(
                    child.clickAction!,
                    false,
                  );
                }
              }
            : null,
      );
    } else if (bootstrapChild.bcData is StyledComponentModel) {
      StyledComponentModel child =
          bootstrapChild.bcData as StyledComponentModel;
      return StyledComponentWidget(
        styledComponentDetails: child,
        containsForm: containsForm,
        innerClickAction: innerClickAction,
      );
    } else if (bootstrapChild.bcData is FormComponentModel) {
      FormComponentModel widget = bootstrapChild.bcData as FormComponentModel;
      return FormComponentWidget(
        formComponentDetails: widget,
        onSaved: (key, value) {
          formData?[key] = value;
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CommonHelpers.getHeightFromDouble(
        bootstrapChild.height,
      ),
      alignment: bootstrapChild.boxAlignment,
      padding: CommonHelpers.getPaddingFromList(
        bootstrapChild.padding,
      ),
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
        sectionBackground: bootstrapChild.background,
      ).copyWith(
        border: bootstrapChild.borderColor != null
            ? Border.all(
                color: CommonHelpers.v2ColorFromHex(
                  bootstrapChild.borderColor,
                ),
              )
            : null,
        borderRadius: CommonHelpers.getBorderRadiusFromList(
          bootstrapChild.borderRadius,
        ),
      ),
      child: buildChild(),
    );
  }
}
