import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class V2GridSectionColumnWidget extends StatelessWidget {
  const V2GridSectionColumnWidget({
    required this.columnDetails,
    required this.containsForm,
    this.innerClickAction,
    this.formData,
    Key? key,
  }) : super(key: key);

  final V2GridSectionColumnModel columnDetails;
  final bool containsForm;
  final InnerClickAction? innerClickAction;
  final Map<String, dynamic>? formData;

  Widget buildChild() {
    if (columnDetails.gridSection != null) {
      return V2GridSectionWidget(
        gridDetails: columnDetails.gridSection!,
        onPressed: (columnDetails.gridSection!.clickAction != null &&
                innerClickAction != null)
            ? () {
                // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
                if (containsForm) {
                  // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
                  for (var action
                      in columnDetails.gridSection!.clickAction!.actions) {
                    if (action.functionType ==
                        V2FunctionTypesEnum.SUBMIT_FORM) {
                      if (action.functionType ==
                          V2FunctionTypesEnum.SUBMIT_FORM) {
                        innerClickAction!.call(
                          columnDetails.gridSection!.clickAction!,
                          true,
                        );
                      }
                    }
                    break;
                  }
                }
                innerClickAction!.call(
                  columnDetails.gridSection!.clickAction!,
                  false,
                );
              }
            : null,
      );
    } else if (columnDetails.styledComponent != null) {
      return StyledComponentWidget(
        styledComponentDetails: columnDetails.styledComponent!,
        containsForm: containsForm,
        innerClickAction: innerClickAction,
      );
    } else if (columnDetails.formComponent != null) {
      return FormComponentWidget(
        formDetails: columnDetails.formComponent!,
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
