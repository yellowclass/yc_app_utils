import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/styled_component/styled_video.model.dart';
import 'package:yc_app_utils/ui/components/generic_network_image.dart';
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
  final Widget Function(ValueNotifier<bool>) getVideoPlayer;
  final void Function(StyledVideoIconModel) onClick;

  @override
  State<StyledVideoWidget> createState() => _StyledVideoWidgetState();
}

class _StyledVideoWidgetState extends State<StyledVideoWidget> {
  final ValueNotifier<bool> showImage = ValueNotifier<bool>(true);
  Widget? videoPlayer;
  final _icons = <Alignment, List<StyledVideoIconModel>?>{};
  final List<Positioned> _overlayIcons = [];

  @override
  void initState() {
    super.initState();
    _icons.clear();
    _overlayIcons.clear();

    videoPlayer = widget.getVideoPlayer.call(showImage);

    widget.styledVideoData.icons?.forEach((element) {
      if (element.iconPosition != null) {
        _icons.putIfAbsent(element.iconPosition!, () => []);
        _icons[element.iconPosition!]?.add(element);
      }
    });
    _buildIcons();
  }

  void _buildIcons() {
    _icons.forEach((key, value) {
      _overlayIcons.add(Positioned.fill(
        child: Align(
          alignment: key,
          child: Wrap(
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
                    : () {
                        widget.onClick.call(e);
                        _buildIcons();
                        setState(() {});
                      },
                child: GenericNetworkImage(
                  e.isActive && _activeURL.isNotEmpty
                      ? _activeURL
                      : _inActiveURL.isNotEmpty
                          ? _inActiveURL
                          : _activeURL,
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
    double _screenWidth = MediaQuery.of(context).size.width;
    double _width = _screenWidth * widget.styledVideoData.width;

    return ClipRect(
      child: SizedBox(
        width: _width,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: widget.styledVideoData.aspectRatio,
              child: FittedBox(
                fit: widget.styledVideoData.videoBoxFit ?? BoxFit.contain,
                child: ValueListenableBuilder<bool>(
                  valueListenable: showImage,
                  builder: (context, value, child) {
                    if (value && videoPlayer != null) {
                      return GenericNetworkImage(
                          widget.styledVideoData.thumbnail);
                    }
                    return videoPlayer!;
                  },
                ),
              ),
            ),
            ..._overlayIcons
          ],
        ),
      ),
    );
  }
}
