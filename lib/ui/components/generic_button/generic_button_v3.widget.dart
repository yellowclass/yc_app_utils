import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class ButtonRowsColumn extends StatelessWidget {
  final GenericButtonV3Model buttonDetails;

  const ButtonRowsColumn({
    required this.buttonDetails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        buttonDetails.buttonRows!.length,
        (rowIndex) {
          final buttonRow = buttonDetails.buttonRows![rowIndex];

          if (buttonRow.buttonColumns != null) {
            return Row(
              mainAxisAlignment: buttonRow.flexAlignment,
              children: List.generate(
                buttonRow.buttonColumns!.length,
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

class GenericButtonV3Widget extends StatelessWidget {
  /// Widget to render [GenericButtonV3]
  ///
  /// Builds a [MaterialButton] from the given params & the design & data
  /// provided by [buttonDetails] param.
  /// Helpful for rendering a [GenericButtonV3] without having to parse the fields
  /// of model repetitively.
  const GenericButtonV3Widget({
    required this.buttonDetails,
    this.onPressed,
    this.isLoading = false,
    this.loadingReplacement,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final GenericButtonV3Model buttonDetails;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? loadingReplacement;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: buttonDetails.height != null ? 0 : 48,
      ),
      height: height ?? buttonDetails.height?.toDouble(),
      width: width ?? buttonDetails.width?.toDouble(),
      decoration: BoxDecoration(
        boxShadow: buttonDetails.shadow,
        borderRadius: BorderRadius.circular(
          buttonDetails.borderRadius,
        ),
      ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
          horizontal: buttonDetails.padding.horizontal,
          vertical: buttonDetails.padding.vertical,
        ),
        elevation: buttonDetails.elevation,
        highlightElevation: buttonDetails.highlightElevation,
        color: CommonHelpers.v2ColorFromHex(
          buttonDetails.backgroundColor,
        ),
        splashColor: buttonDetails.splashColor != null
            ? CommonHelpers.v2ColorFromHex(
                buttonDetails.splashColor!,
              )
            : null,
        disabledColor: CommonHelpers.v2ColorFromHex(
          buttonDetails.backgroundColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            buttonDetails.borderRadius,
          ),
          side: BorderSide(
            color: CommonHelpers.v2ColorFromHex(
              buttonDetails.borderColor,
            ),
          ),
        ),
        child: isLoading
            ? loadingReplacement ??
                const Center(
                  child: ThreeBounceLoader(
                    color: AppColors.cWHITE_100,
                    size: AppSpacing.l,
                    duration: Duration(
                      milliseconds: 1000,
                    ),
                  ),
                )
            : buttonDetails.buttonRows != null
                ? ButtonRowsColumn(
                    buttonDetails: buttonDetails,
                  )
                : const SizedBox.shrink(),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
