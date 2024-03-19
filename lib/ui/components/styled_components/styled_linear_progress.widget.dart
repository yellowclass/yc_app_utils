import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/styled_component/styled_linear_progress.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledLinearProgressWidget extends StatelessWidget {
  const StyledLinearProgressWidget({
    required this.styledLinearProgressData,
    Key? key,
  }) : super(key: key);

  final StyledLinearProgress styledLinearProgressData;

  int get percentageFlex => (styledLinearProgressData.percentage).toInt();

  double get completionBarHeight => styledLinearProgressData.height ?? 6;

  int get thumbFlex => (100 /
          (YCMediaQuery.screenWidth! - AppSpacing.xl) *
          (styledLinearProgressData.thumb?.text != null ? 40 : 20))
      .toInt();

  EdgeInsets get getBarPadding => styledLinearProgressData.thumb != null
      ? EdgeInsets.only(
          top: (styledLinearProgressData.thumb?.text != null ? 10 : 15) -
              completionBarHeight / 2,
        )
      : EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: (styledLinearProgressData.trailingIcon?.url != null ||
                  styledLinearProgressData.trailingText != null)
              ? 9
              : 10,
          child: Stack(
            children: [
              Padding(
                padding: getBarPadding,
                child: Container(
                  height: styledLinearProgressData.height ?? 6,
                  decoration:
                      CommonHelpers.getBoxDecorationWithSectionBackground(
                    sectionBackground:
                        styledLinearProgressData.inactiveBackground,
                  ),
                ),
              ),
              Padding(
                padding: getBarPadding,
                child: Row(
                  children: [
                    Expanded(
                      flex: percentageFlex,
                      child: Container(
                        height: styledLinearProgressData.height ?? 6,
                        decoration:
                            CommonHelpers.getBoxDecorationWithSectionBackground(
                          sectionBackground:
                              styledLinearProgressData.activeBackground,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 100 - percentageFlex,
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
              if (styledLinearProgressData.thumb?.text != null ||
                  styledLinearProgressData.thumb?.imageUrl != null)
                Row(
                  children: [
                    Expanded(
                      flex: percentageFlex - thumbFlex,
                      child: Container(
                        height: styledLinearProgressData.height ?? 6,
                        color: AppColors.cTRANSPARENT,
                      ),
                    ),
                    Container(
                      width: styledLinearProgressData.thumb?.text != null
                          ? 40
                          : 20,
                      height: 20,
                      decoration:
                          CommonHelpers.getBoxDecorationWithSectionBackground(
                        sectionBackground:
                            styledLinearProgressData.thumb?.background,
                      ),
                      child: styledLinearProgressData.thumb?.text != null
                          ? Padding(
                              padding: const EdgeInsets.all(2),
                              child: FittedBox(
                                child: V2StyledTextWidget(
                                  styledText:
                                      styledLinearProgressData.thumb!.text!,
                                ),
                              ),
                            )
                          : GenericNetworkImage(
                              styledLinearProgressData.thumb!.imageUrl!,
                            ),
                    ),
                    Expanded(
                      flex: 100 - percentageFlex - thumbFlex,
                      child: const SizedBox(),
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (styledLinearProgressData.trailingIcon?.url != null)
          Expanded(
            flex: 1,
            child: GenericNetworkImage(
              styledLinearProgressData.trailingIcon!.url!,
            ),
          ),
        if (styledLinearProgressData.trailingText != null)
          Padding(
            padding: styledLinearProgressData.thumb?.imageUrl != null
                ? const EdgeInsets.only(top: 10)
                : EdgeInsets.zero,
            child: V2StyledTextWidget(
              styledText: styledLinearProgressData.trailingText!,
            ),
          )
      ],
    );
  }
}
