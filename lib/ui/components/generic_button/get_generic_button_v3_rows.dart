import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class GetGenericButtonV3RowsWidget extends StatelessWidget {
  final GenericButtonV3Model buttonDetails;

  const GetGenericButtonV3RowsWidget({
    required this.buttonDetails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        buttonDetails.buttonRows?.length ?? 0,
        (rowIndex) {
          final buttonRow = buttonDetails.buttonRows![rowIndex];

          if (buttonRow.buttonColumns != null) {
            return Row(
              mainAxisAlignment: buttonRow.flexAlignment,
              children: List.generate(
                buttonRow.buttonColumns?.length ?? 0,
                (colIndex) => StyledComponentWidget(
                  styledComponent: buttonRow.buttonColumns![colIndex],
                  containsForm: false,
                ),
              ),
            );
          } else if (buttonRow.buttonColumnData != null) {
            return Row(
              mainAxisAlignment: buttonRow.flexAlignment,
              children: List.generate(
                buttonRow.buttonColumnData!.length,
                (dataIndex) {
                  final buttonCell = buttonRow.buttonColumnData![dataIndex];
                  return Container(
                    padding: buttonCell.padding != null
                        ? CommonHelpers.getPaddingFromList(
                            buttonCell.padding,
                          )
                        : const EdgeInsets.symmetric(
                            vertical: AppSpacing.xxs2,
                            horizontal: AppSpacing.xxs,
                          ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        buttonCell.borderRadius?.toDouble() ?? AppRadius.xxs,
                      ),
                      color: CommonHelpers.v2ColorFromHex(
                        buttonCell.backgroundColor,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (buttonCell.prefixIcon?.url != null)
                          GenericNetworkImage(
                            buttonCell.prefixIcon!.url!,
                          ),
                        Container(
                          margin: buttonCell.text.isNotEmpty
                              ? const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.xxs,
                                )
                              : EdgeInsets.zero,
                          child: Text(
                            buttonCell.text,
                            textAlign: buttonCell.textAlign,
                            style: CommonHelpers.getTextStyle(
                              buttonCell.tStyle,
                              customStyle: TextStyle(
                                color: CommonHelpers.v2ColorFromHex(
                                  buttonCell.textColor,
                                ),
                                decoration: buttonCell.strikeThrough
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        if (buttonCell.suffixIcon?.url != null)
                          GenericNetworkImage(
                            buttonCell.suffixIcon!.url!,
                          ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
