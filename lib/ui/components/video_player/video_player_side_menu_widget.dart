import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class VideoPlayerSideMenuWidget extends StatelessWidget {
  const VideoPlayerSideMenuWidget({
    required this.sideMenu,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final VideoPlayerSideMenuModel sideMenu;
  final double? height;
  final double? width;

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
        children: [
          ...sideMenu.options.sublist(0, sideMenu.spacerIndex).map(
                (option) => GenericButtonV3Widget(buttonDetails: option),
              ),
          const Spacer(),
          ...sideMenu.options.sublist(sideMenu.spacerIndex).map(
                (option) => GenericButtonV3Widget(buttonDetails: option),
              ),
        ],
      ),
    );
  }
}
