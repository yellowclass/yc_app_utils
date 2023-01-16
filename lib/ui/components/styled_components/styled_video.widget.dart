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

  @override
  void initState() {
    super.initState();
    videoPlayer = widget.getVideoPlayer.call(showImage);
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
        //todo(kshivam1177) : render icons with the help of stack
        return Stack(
          children: [
            videoPlayer!,
            Text(
              widget.styledVideoData.icons?.length.toString() ??
                  "icons count (0) ",
            )
          ],
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
