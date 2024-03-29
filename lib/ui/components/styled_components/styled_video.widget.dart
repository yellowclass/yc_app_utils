import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/click_action/one_click_action.model.dart';
import 'package:yc_app_utils/models/media_manager_info.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_video.model.dart';
import 'package:yc_app_utils/ui/components/generic_network_image.dart';
import 'package:yc_app_utils/ui/media_query/yc_media_query.dart';
import 'package:yc_app_utils/ui/styleguide/colors.dart';
import 'package:yc_app_utils/ui/styleguide/spacing.dart';

class StyledVideoWidget extends StatefulWidget {
  const StyledVideoWidget({
    required this.styledVideoData,
    required this.getVideoPlayer,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final StyledVideoModel styledVideoData;
  final Widget Function(MediaManagerInfo mediInfo) getVideoPlayer;
  final Future<StyledVideoIconModel> Function(StyledVideoIconModel) onClick;

  @override
  State<StyledVideoWidget> createState() => _StyledVideoWidgetState();
}

class _StyledVideoWidgetState extends State<StyledVideoWidget> {
  // final ValueNotifier<bool> showImage = ValueNotifier<bool>(true);
  Widget? videoPlayer;
  final _icons = <Alignment, List<StyledVideoIconModel>?>{};
  final List<Positioned> _overlayIcons = [];

  @override
  void initState() {
    super.initState();
    _icons.clear();

    bool _playInMute = false, playInitially = false;

    for (int x = 0; x < (widget.styledVideoData.icons?.length ?? 0); x++) {
      final element = widget.styledVideoData.icons![x];

      // for creating a list that align icons accordingly
      if (element.iconPosition != null) {
        _icons.putIfAbsent(element.iconPosition!, () => []);
        _icons[element.iconPosition!]?.add(element);
      }

      // for setting initial [play]/[pause] value to player and sync with icon
      final _isPlayPause = element.clickAction?.actions.any((ea) {
        return ea.functionType == V2FunctionTypesEnum.PLAY_PAUSE;
      });
      if (_isPlayPause ?? false) {
        if (element.isActive) {
          element.isActive = widget.styledVideoData.autoPlay;
        }
        playInitially = element.isActive;
        continue;
      }

      // for setting initial [mute]/[unmute] value to player and sync with icon
      final _isMuteUnMute = element.clickAction?.actions.any((ea) {
        return ea.functionType == V2FunctionTypesEnum.MUTE_UNMUTE;
      });
      if (_isMuteUnMute ?? false) {
        element.isActive = widget.styledVideoData.volume > 0;
        // widget.videoPlayerBloc.setAutoPlayInMute = !element.isActive;
        _playInMute = !element.isActive;
        continue;
      }
    }

    videoPlayer = widget.getVideoPlayer.call(
      MediaManagerInfo(
        url: widget.styledVideoData.url,
        autoPlay: widget.styledVideoData.autoPlay && playInitially,
        looping: widget.styledVideoData.loop,
        volume: _playInMute ? 0 : widget.styledVideoData.volume,
      ),
    );
    _buildIcons();
  }

  void _buildIcons() {
    _overlayIcons.clear();
    _icons.forEach((key, value) {
      _overlayIcons.add(Positioned.fill(
        child: Align(
          key: ValueKey(key.toString()),
          alignment: key,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: value!.map((e) {
              String _activeURL = e.activeIconUrl ?? "";
              String _inActiveURL = e.inactiveIconUrl ?? "";
              if (_activeURL.isEmpty && _inActiveURL.isEmpty) {
                return Container(
                  width: AppSpacing.xxl,
                  height: AppSpacing.xxl,
                  color: AppColors.cBLACK_20,
                );
              }
              return InkWell(
                onTap: e.clickAction == null
                    ? null
                    : () async {
                        final updated = await widget.onClick.call(e);
                        widget.styledVideoData.icons![updated.index] = updated;
                        _buildIcons();
                        setState(() {});
                      },
                child: GenericNetworkImage(
                  e.isActive && _activeURL.isNotEmpty
                      ? _activeURL
                      : _inActiveURL.isNotEmpty
                          ? _inActiveURL
                          : _activeURL,
                  placeholder: const SizedBox(
                    width: AppSpacing.m,
                    height: AppSpacing.m,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.styledVideoData.url;
    if (url.isEmpty) {
      return const SizedBox.shrink();
    }
    double _screenWidth = YCMediaQuery.screenWidth!;
    double _width = _screenWidth * (widget.styledVideoData.width / 100);

    return ClipRect(
      child: SizedBox(
        width: _width,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: widget.styledVideoData.aspectRatio,
              child: FittedBox(
                fit: widget.styledVideoData.videoBoxFit ?? BoxFit.contain,
                child: videoPlayer!,
                // child: ValueListenableBuilder<bool>(
                //   valueListenable: showImage,
                //   builder: (context, value, child) {
                //     if (value && videoPlayer != null) {
                //       return GenericNetworkImage(
                //         widget.styledVideoData.thumbnail,
                //       );
                //     }
                //     return videoPlayer!;
                //   },
                // ),
              ),
            ),
            ..._overlayIcons
          ],
        ),
      ),
    );
  }
}
