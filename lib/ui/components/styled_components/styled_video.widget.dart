import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yc_app_utils/models/styled_component/styled_video.model.dart';
import 'package:yc_app_utils/ui/styleguide/colors.dart';
import 'package:yc_app_utils/ui/styleguide/spacing.dart';

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
              // if (_activeURL.isEmpty && _inActiveURL.isEmpty) {
              //   return Container(
              //     width: AppSpacing.m,
              //     height: AppSpacing.m,
              //     color: AppColors.cBLACK_05,
              //   );
              // }
              return InkWell(
                onTap: e.clickAction == null
                    ? null
                    : () {
                        // handle click action here
                        e.isActive = !e.isActive;
                        _buildIcons();
                        setState(() {});
                      },
                child: Container(
                  width: AppSpacing.m,
                  height: AppSpacing.m,
                  margin: const EdgeInsets.all(4),
                  color: e.isActive ? AppColors.cBLACK_20 : AppColors.cGREEN_15,
                ),
                // child: GenericNetworkImage(
                //   e.isActive && _activeURL.isNotEmpty
                //       ? _activeURL
                //       : _inActiveURL.isNotEmpty
                //           ? _inActiveURL
                //           : _activeURL,
                // ),
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
