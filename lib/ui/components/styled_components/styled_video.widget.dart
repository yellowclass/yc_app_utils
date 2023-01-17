import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yc_app_utils/models/styled_component/styled_video.model.dart';

class StyledVideoWidget extends StatefulWidget {
  const StyledVideoWidget({
    required this.styledVideoData,
    required this.getVideoPlayer,
    Key? key,
  }) : super(key: key);

  final StyledVideoModel styledVideoData;
  final Widget Function(ValueNotifier<bool>) getVideoPlayer;

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

    _icons.forEach((key, value) {
      _overlayIcons.add(
        Positioned.fill(
          child: Align(
            alignment: key,
            child: SizedBox(
              // width: double.minPositive,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [BackButton(), CloseButton()],
              ),
              // color: Color(
              //   (math.Random().nextDouble() * 0xFFFFFF).toInt(),
              // ).withOpacity(1.0),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.styledVideoData.url;
    if (url.isEmpty) {
      return const SizedBox.shrink();
    }
    return ValueListenableBuilder<bool>(
      valueListenable: showImage,
      builder: (context, value, child) {
        if (value && videoPlayer != null) {
          return _getImage(widget.styledVideoData.thumbnail);
        }
        return Stack(
          children: [videoPlayer!, ..._overlayIcons],
        );
      },
    );
  }

  Widget _getImage(String url) {
    final bool isSvg = Uri.parse(url).path.split(".").last == 'svg';
    return isSvg
        ? SvgPicture.network(url)
        : CachedNetworkImage(
            imageUrl: url,
            httpHeaders: const {
              "Accept": "image/webp,image/apng,image/*,*/*;q=0.8",
            },
          );
  }
}
