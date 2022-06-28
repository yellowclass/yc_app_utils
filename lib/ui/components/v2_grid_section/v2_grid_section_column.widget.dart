import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/form_component/form_component.model.dart';

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
    if (columnDetails.widget is V2GridSectionModel) {
      V2GridSectionModel widget = columnDetails.widget as V2GridSectionModel;
      return V2GridSectionWidget(
        gridDetails: widget,
        onPressed: (widget.clickAction != null && innerClickAction != null)
            ? () {
                // BUTTON SUBMIT (Validation/Data Collection in formData) LOGIC
                if (containsForm) {
                  // CHECKS IF THERE IS ANY SUBMIT BUTTON INSIDE CLICKACTIONS (Checks for only 1
                  for (var action in widget.clickAction!.actions) {
                    if (action.functionType ==
                        V2FunctionTypesEnum.SUBMIT_FORM) {
                      innerClickAction!.call(
                        widget.clickAction!,
                        true,
                      );
                    }
                    break;
                  }
                } else {
                  innerClickAction!.call(
                    widget.clickAction!,
                    false,
                  );
                }
              }
            : null,
      );
    } else if (columnDetails.widget is StyledComponentModel) {
      StyledComponentModel widget =
          columnDetails.widget as StyledComponentModel;
      return StyledComponentWidget(
        styledComponentDetails: widget,
        containsForm: containsForm,
        innerClickAction: innerClickAction,
      );
    } else if (columnDetails.widget is FormComponentModel) {
      FormComponentModel widget = columnDetails.widget as FormComponentModel;
      return FormComponentWidget(
        formDetails: widget,
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
