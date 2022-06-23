import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

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
    Key? key,
  }) : super(key: key);

  final GenericButtonV3Model buttonDetails;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? loadingReplacement;
  final int? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: buttonDetails.height != null ? 0 : 48,
      ),
      height: buttonDetails.height?.toDouble(),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
          horizontal: buttonDetails.padding.horizontal,
          vertical: buttonDetails.padding.vertical,
        ),
        elevation: buttonDetails.elevation,
        color: CommonHelpers.v2ColorFromHex(
          buttonDetails.backgroundColor,
        ),
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
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: buttonDetails.buttonRows!
                        .map(
                          (buttonRow) => buttonRow.buttonColumnData != null
                              ? Row(
                                  mainAxisAlignment: buttonRow.flexAlignment,
                                  children: buttonRow.buttonColumnData!
                                      .map(
                                        (buttonCell) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: AppSpacing.xxs2,
                                            horizontal: AppSpacing.xxs,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              AppRadius.xxs,
                                            ),
                                            color: CommonHelpers.v2ColorFromHex(
                                              buttonCell.backgroundColor,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              if (buttonCell.prefixIcon?.url !=
                                                  null)
                                                GenericNetworkImage(
                                                  buttonCell.prefixIcon!.url!,
                                                ),
                                              Container(
                                                margin:
                                                    buttonCell.text.isNotEmpty
                                                        ? const EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                                AppSpacing.xxs,
                                                          )
                                                        : EdgeInsets.zero,
                                                child: Text(
                                                  buttonCell.text,
                                                  textAlign:
                                                      buttonCell.textAlign,
                                                  style: CommonHelpers
                                                      .getTextStyle(
                                                    buttonCell.tStyle,
                                                    customStyle: TextStyle(
                                                      color: CommonHelpers
                                                          .v2ColorFromHex(
                                                        buttonCell.textColor,
                                                      ),
                                                      decoration: buttonCell
                                                              .strikeThrough
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (buttonCell.suffixIcon?.url !=
                                                  null)
                                                GenericNetworkImage(
                                                  buttonCell.suffixIcon!.url!,
                                                ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )
                              : const SizedBox.shrink(),
                        )
                        .toList(),
                  )
                : const SizedBox.shrink(),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
