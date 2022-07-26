import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yc_app_utils/models/styled_component/styled_image.model.dart';

class StyledImageWidget extends StatelessWidget {
  const StyledImageWidget({
    required this.styledImageData,
    Key? key,
  }) : super(key: key);

  final StyledImageModel styledImageData;

  @override
  Widget build(BuildContext context) {
    String url = styledImageData.url;
    if (url.isEmpty) {
      return const SizedBox.shrink();
    }

    final bool isSvg = Uri.parse(url).path.split(".").last == 'svg';
    Widget image = isSvg
        ? SvgPicture.network(
            url,
          )
        : CachedNetworkImage(
            imageUrl: url,
            httpHeaders: const {
              "Accept": "image/webp,image/apng,image/*,*/*;q=0.8",
            },
          );
    return image;
  }
}
