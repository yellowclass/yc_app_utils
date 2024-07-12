import 'package:flutter/material.dart';
import 'package:yc_app_utils/ui/components/generic_button/get_generic_button_v3_rows.dart';
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
                ? GetGenericButtonV3RowsWidget(
                    buttonDetails: buttonDetails,
                  )
                : const SizedBox.shrink(),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
