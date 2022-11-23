import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class VideoPlayerSideMenuWidget extends StatelessWidget {
  const VideoPlayerSideMenuWidget({
    required this.sideMenu,
    required this.onPressed,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final VideoPlayerSideMenuModel sideMenu;
  final double? height;
  final double? width;
  final void Function(String?, ClickAction?) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.s,
      ),
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
        sectionBackground: sideMenu.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...sideMenu.options
              .sublist(0, sideMenu.spacerIndex)
              .map(_buildButton),
          const Spacer(),
          ...sideMenu.options.sublist(sideMenu.spacerIndex).map(_buildButton),
        ],
      ),
    );
  }

  Widget _buildButton(GenericButtonV3Model model) {
    return GenericButtonV3Widget(
      buttonDetails: model,
      onPressed: () => onPressed(
        model.key,
        model.clickAction,
      ),
    );
  }
}
